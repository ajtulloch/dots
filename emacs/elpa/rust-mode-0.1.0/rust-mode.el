;;; rust-mode.el --- A major emacs mode for editing Rust source code

;; Version: 0.1.0
;; Author: Mozilla
;; Package-Requires: ((cm-mode "0.1.0"))
;; Url: https://github.com/mozilla/rust

(require 'cm-mode)
(require 'cc-mode)
(eval-when-compile (require 'cl))

(defun rust-electric-brace (arg)
  (interactive "*P")
  (self-insert-command (prefix-numeric-value arg))
  (when (and c-electric-flag
             (not (member (get-text-property (point) 'face)
                          '(font-lock-comment-face font-lock-string-face))))
    (cm-indent)))

(defvar rust-indent-unit 4)
(defvar rust-syntax-table (let ((table (make-syntax-table)))
                            (c-populate-syntax-table table)
                            table))

(defun make-rust-state ()
  (vector 'rust-token-base
          (list (vector 'top (- rust-indent-unit) nil nil nil))
          0
          nil))
(defmacro rust-state-tokenize (x) `(aref ,x 0))
(defmacro rust-state-context (x) `(aref ,x 1))
(defmacro rust-state-indent (x) `(aref ,x 2))
(defmacro rust-state-last-token (x) `(aref ,x 3))

(defmacro rust-context-type (x) `(aref ,x 0))
(defmacro rust-context-indent (x) `(aref ,x 1))
(defmacro rust-context-column (x) `(aref ,x 2))
(defmacro rust-context-align (x) `(aref ,x 3))
(defmacro rust-context-info (x) `(aref ,x 4))

(defun rust-push-context (st type &optional align-column auto-align)
  (let ((ctx (vector type (rust-state-indent st) align-column
                     (if align-column (if auto-align t 'unset) nil) nil)))
    (push ctx (rust-state-context st))
    ctx))
(defun rust-pop-context (st)
  (let ((old (pop (rust-state-context st))))
    (setf (rust-state-indent st) (rust-context-indent old))
    old))
(defun rust-dup-context (st)
  (let* ((list (rust-state-context st))
         (dup (copy-sequence (car list))))
    (setf (rust-state-context st) (cons dup (cdr list)))
    dup))

(defvar rust-operator-chars "-+/%=<>!*&|@~^")
(defvar rust-punc-chars "()[].,{}:;")
(defvar rust-value-keywords
  (let ((table (make-hash-table :test 'equal)))
    (dolist (word '("mod" "const" "class" "type"
                    "trait" "struct" "fn" "enum"
                    "impl"))
      (puthash word 'def table))
    (dolist (word '("again" "assert"
                    "break"
                    "copy"
                    "do" "drop"
                    "else" "export" "extern"
                    "fail" "for"
                    "if" "use"
                    "let" "log" "loop"
                    "move" "new"
                    "pure" "pub" "priv"
                    "ref" "return" "static"
                    "unchecked" "unsafe"
                    "while"))
      (puthash word t table))
    (puthash "match" 'alt table)
    (dolist (word '("true" "false")) (puthash word 'atom table))
    table))
;; FIXME type-context keywords

(defvar rust-tcat nil "Kludge for multiple returns without consing")

(defmacro rust-eat-re (re)
  `(when (looking-at ,re) (goto-char (match-end 0)) t))

(defvar rust-char-table
  (let ((table (make-char-table 'syntax-table)))
    (macrolet ((def (range &rest body)
                    `(let ((--b (lambda (st) ,@body)))
                       ,@(mapcar (lambda (elt)
	                           (if (consp elt)
                                       `(loop for ch from ,(car elt) to ,(cdr elt) collect
                                              (set-char-table-range table ch --b))
                                     `(set-char-table-range table ',elt --b)))
                                 (if (consp range) range (list range))))))
      (def t (forward-char) nil)
      (def (32 ?\t) (skip-chars-forward " \t") nil)
      (def ?\" (forward-char)
           (rust-push-context st 'string (current-column) t)
           (setf (rust-state-tokenize st) 'rust-token-string)
           (rust-token-string st))
      (def ?\' (forward-char)
           (setf rust-tcat 'atom)
           (let ((is-escape (eq (char-after) ?\\))
                 (start (point)))
             (if (not (rust-eat-until-unescaped ?\'))
                 'font-lock-warning-face
               (if (or is-escape (= (point) (+ start 2)))
                   'font-lock-string-face 'font-lock-warning-face))))
      (def ?/ (forward-char)
           (case (char-after)
             (?/ (end-of-line) 'font-lock-comment-face)
             (?* (forward-char)
                 (rust-push-context st 'comment)
                 (setf (rust-state-tokenize st) 'rust-token-comment)
                 (rust-token-comment st))
             (t (skip-chars-forward rust-operator-chars) (setf rust-tcat 'op) nil)))
      (def ?# (forward-char)
           (cond ((eq (char-after) ?\[) (forward-char) (setf rust-tcat 'open-attr))
                 ((rust-eat-re "[a-z_]+") (setf rust-tcat 'macro)))
           'font-lock-preprocessor-face)
      (def ((?a . ?z) (?A . ?Z) ?_)
           (rust-eat-re "[a-zA-Z_][a-zA-Z0-9_]*")
           (setf rust-tcat 'ident)
           (if (and (eq (char-after) ?:) (eq (char-after (+ (point) 1)) ?:)
                    (not (eq (char-after (+ (point) 2)) ?:)))
               (progn (forward-char 2) 'font-lock-builtin-face)
             (match-string 0)))
      (def ((?0 . ?9))
           (rust-eat-re "0x[0-9a-fA-F_]+\\|0b[01_]+\\|[0-9_]+\\(\\.[0-9_]+\\)?\\(e[+\\-]?[0-9_]+\\)?")
           (setf rust-tcat 'atom)
           (rust-eat-re "[iuf][0-9_]*")
           'font-lock-constant-face)
      (def ?. (forward-char)
           (cond ((rust-eat-re "[0-9]+\\(e[+\\-]?[0-9]+\\)?")
                  (setf rust-tcat 'atom)
                  (rust-eat-re "f[0-9]+")
                  'font-lock-constant-face)
                 (t (setf rust-tcat (char-before)) nil)))
      (def (?\( ?\) ?\[ ?\] ?\{ ?\} ?: ?\; ?,)
           (forward-char)
           (setf rust-tcat (char-before)) nil)
      (def ?|
           (skip-chars-forward rust-operator-chars)
           (setf rust-tcat 'pipe) nil)
      (def (?+ ?- ?% ?= ?< ?> ?! ?* ?& ?@ ?~)
           (skip-chars-forward rust-operator-chars)
           (setf rust-tcat 'op) nil)
      table)))

(defun rust-token-base (st)
  (funcall (char-table-range rust-char-table (char-after)) st))

(defun rust-eat-until-unescaped (ch)
  (let (escaped)
    (loop
     (let ((cur (char-after)))
       (when (or (eq cur ?\n) (not cur)) (return nil))
       (forward-char)
       (when (and (eq cur ch) (not escaped)) (return t))
       (setf escaped (and (not escaped) (eq cur ?\\)))))))

(defun rust-token-string (st)
  (setf rust-tcat 'atom)
  (cond ((rust-eat-until-unescaped ?\")
         (setf (rust-state-tokenize st) 'rust-token-base)
         (rust-pop-context st))
        (t (let ((align (eq (char-before) ?\\)))
             (unless (eq align (rust-context-align (car (rust-state-context st))))
               (setf (rust-context-align (rust-dup-context st)) align)))))
  'font-lock-string-face)

(defun rust-token-comment (st)
  (let ((eol (point-at-eol)))
    (loop
     (unless (re-search-forward "\\(/\\*\\)\\|\\(\\*/\\)" eol t)
       (goto-char eol)
       (return))
     (if (match-beginning 1)
         (push (car (rust-state-context st)) (rust-state-context st))
       (rust-pop-context st)
       (unless (eq (rust-context-type (car (rust-state-context st))) 'comment)
         (setf (rust-state-tokenize st) 'rust-token-base)
         (return))))
    'font-lock-comment-face))

(defun rust-next-block-info (st)
  (dolist (cx (rust-state-context st))
    (when (eq (rust-context-type cx) ?\}) (return (rust-context-info cx)))))

(defun rust-token (st)
  (let ((cx (car (rust-state-context st))))
    (when (bolp)
      (setf (rust-state-indent st) (current-indentation))
      (when (eq (rust-context-align cx) 'unset)
        (setf (rust-context-align cx) nil)))
    (setf rust-tcat nil)
    (let* ((tok (funcall (rust-state-tokenize st) st))
           (tok-id (or tok rust-tcat))
           (cur-cx (rust-context-type cx))
           (cx-info (rust-context-info cx)))
      (when (stringp tok)
        (setf tok-id (gethash tok rust-value-keywords nil))
        (setf tok (cond ((eq tok-id 'atom) 'font-lock-constant-face)
                        (tok-id 'font-lock-keyword-face)
                        ((equal (rust-state-last-token st) 'def) 'font-lock-function-name-face)
                        (t nil))))
      (when rust-tcat
        (when (eq (rust-context-align cx) 'unset)
          (setf (rust-context-align cx) t))
        (when (eq cx-info 'alt-1)
          (setf cx (rust-dup-context st))
          (setf (rust-context-info cx) 'alt-2))
        (when (and (eq rust-tcat 'pipe) (eq (rust-state-last-token st) ?{))
          (setf cx (rust-dup-context st))
          (setf (rust-context-info cx) 'block))
        (case rust-tcat
          ((?\; ?,) (when (eq cur-cx 'statement) (rust-pop-context st)))
          (?\{
           (when (and (eq cur-cx 'statement) (not (member cx-info '(alt-1 alt-2))))
             (rust-pop-context st))
           (when (eq cx-info 'alt-2)
             (setf cx (rust-dup-context st))
             (setf (rust-context-info cx) nil))
           (let ((next-info (rust-next-block-info st))
                 (newcx (rust-push-context st ?\} (current-column))))
             (cond ((eq cx-info 'alt-2) (setf (rust-context-info newcx) 'alt-outer))
                   ((eq next-info 'alt-outer) (setf (rust-context-info newcx) 'alt-inner)))))
          ((?\[ open-attr)
           (let ((newcx (rust-push-context st ?\] (current-column))))
             (when (eq rust-tcat 'open-attr)
               (setf (rust-context-info newcx) 'attr))))
          (?\( (rust-push-context st ?\) (current-column))
               (when (eq (rust-context-info cx) 'attr)
                 (setf (rust-context-info (car (rust-state-context st))) 'attr)))
          (?\} (when (eq cur-cx 'statement) (rust-pop-context st))
               (when (eq (rust-context-type (car (rust-state-context st))) ?})
                 (rust-pop-context st))
               (setf cx (car (rust-state-context st)))
               (when (and (eq (rust-context-type cx) 'statement)
                          (not (eq (rust-context-info cx) 'alt-2)))
                 (rust-pop-context st)))
          (t (cond ((eq cur-cx rust-tcat)
                    (when (eq (rust-context-info (rust-pop-context st)) 'attr)
                      (setf tok 'font-lock-preprocessor-face)
                      (when (eq (rust-context-type (car (rust-state-context st))) 'statement)
                        (rust-pop-context st))))
                   ((or (and (eq cur-cx ?\}) (not (eq (rust-context-info cx) 'alt-outer)))
                        (eq cur-cx 'top))
                    (rust-push-context st 'statement)))))
        (setf (rust-state-last-token st) tok-id))
      (setf cx (car (rust-state-context st)))
      (when (and (eq tok-id 'alt) (eq (rust-context-type cx) 'statement))
        (setf (rust-context-info cx) 'alt-1))
      (when (and (eq (rust-state-last-token st) 'pipe)
                 (eq (rust-next-block-info st) 'block) (eolp))
        (when (eq (rust-context-type cx) 'statement) (rust-pop-context st))
        (setf cx (rust-dup-context st)
              (rust-context-info cx) nil
              (rust-context-align cx) nil))
      (if (eq (rust-context-info cx) 'attr)
          'font-lock-preprocessor-face
        tok))))

(defun rust-indent (st)
  (let ((cx (car (rust-state-context st)))
        (parent (cadr (rust-state-context st))))
    (when (and (eq (rust-context-type cx) 'statement)
               (or (eq (char-after) ?\}) (looking-at "with \\|{[ 	]*$")))
      (setf cx parent parent (caddr (rust-state-context st))))
    (let* ((tp (rust-context-type cx))
           (closing (eq tp (char-after)))
           (unit rust-indent-unit)
           (base (if (and (eq tp 'statement) parent (rust-context-align parent))
                     (rust-context-column parent) (rust-context-indent cx))))
      (cond ((eq tp 'comment) base)
            ((eq tp 'string) (if (rust-context-align cx) (rust-context-column cx) 0))
            ((eq tp 'statement) (+ base (if (eq (char-after) ?\}) 0 unit)))
            ((eq (rust-context-align cx) t) (+ (rust-context-column cx) (if closing -1 0)))
            (t (+ base (if closing 0 unit)))))))

;;;###autoload
(define-derived-mode rust-mode fundamental-mode "Rust"
  "Major mode for editing Rust source files."
  (set-syntax-table rust-syntax-table)
  (setq major-mode 'rust-mode mode-name "Rust")
  (run-hooks 'rust-mode-hook)
  (set (make-local-variable 'indent-tabs-mode) nil)
  (let ((par "[ 	]*\\(//+\\|\\**\\)[ 	]*$"))
    (set (make-local-variable 'paragraph-start) par)
    (set (make-local-variable 'paragraph-separate) par))
  (set (make-local-variable 'comment-start) "//")
  (cm-mode (make-cm-mode 'rust-token 'make-rust-state 'copy-sequence 'equal 'rust-indent)))

(define-key rust-mode-map "}" 'rust-electric-brace)
(define-key rust-mode-map "{" 'rust-electric-brace)

;;;###autoload
(progn
  (add-to-list 'auto-mode-alist '("\\.rs$" . rust-mode))
  (add-to-list 'auto-mode-alist '("\\.rc$" . rust-mode)))

(provide 'rust-mode)

;;; rust-mode.el ends here
