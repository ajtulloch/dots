;;; tulloch --- Summary
;;; Commentary:
;;; Code:
;; Global configuration

(require 'auto-complete)
(require 'go-autocomplete)
(require 'auto-complete-config)
(require 'go-mode-load)
(require 'cider)
(require 'paredit)

;;; Shortcuts
(global-set-key "\C-x\C-m" 'smex)
(global-set-key "\C-c\C-m" 'smex)
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-c\C-g" 'magit-status)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)
(global-unset-key "\C-x\C-n")

(load-theme 'solarized-dark t)
(smex-initialize)
(column-number-mode t)
(defalias 'qrr 'query-replace-regexp)
(global-set-key [f5] 'call-last-kbd-macro)
(global-set-key [f7] 'compile)
(add-to-list 'auto-mode-alist '("\\.cu\\'" . c++-mode))

;; Golang

(add-to-list 'load-path "/usr/local/go/misc/emacs" t)
(add-to-list 'load-path "~/Code/go/src/github.com/nsf/gocode/emacs" t)

(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "\C-c\C-r") 'go-remove-unused-imports)))
(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "\C-ci") 'go-goto-imports)))
(add-hook 'go-mode-hook (lambda ()
                          (setq tab-width 4)))
(add-hook 'before-save-hook 'gofmt-before-save)

;; SCSS
(setq scss-compile-at-save nil)

;; SCALA
(setq scala-indent:use-javadoc-style t)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

;; JS
(custom-set-variables '(coffee-tab-width 2))
(setq js-indent-level 2)

;; HS
(setq haskell-stylish-on-save t)
(setq haskell-font-lock-symbols t)


;; C++
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-hook 'markdown-mode 'longlines-mode)

;; Color
;; (color-theme-solarized-dark)            


(add-to-list 'ac-modes 'nrepl-mode)


(font-lock-add-keywords
 'clojure-mode
 (mapcar
  (lambda (pair)
    `(,(car pair)
      (0 (progn (compose-region
                 (match-beginning 0) (match-end 0)
                 ,(cadr pair))
                nil))))
  '(("\\<fn\\>" ?ƒ)
    ("\\<comp\\>" ?∘)
    ("\\<partial\\>" ?þ)
    ("\\<complement\\>" ?¬))))



(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)


(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'emacs-lisp-mode-hook 'paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook 'paredit-mode)
(add-hook 'ielm-mode-hook 'paredit-mode)
(add-hook 'lisp-mode-hook 'paredit-mode)
(add-hook 'lisp-interaction-mode-hook 'paredit-mode)
(add-hook 'scheme-mode-hook 'paredit-mode)

;; C++
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

;; LATEX
(add-hook 'LaTeX-mode-hook (lambda ()
                             (TeX-run-style-hooks "amsmath" "amsthm" "latex2e")))
(add-hook 'LaTeX-mode-hook (lambda ()
                             (TeX-fold-mode 1)))
(add-hook 'LaTeX-mode-hook
          '(lambda ()
             (define-key LaTeX-mode-map (kbd "$") 'self-insert-command)))
;; (add-hook 'LaTeX-mode-hook 'electric-pair-mode)
(add-hook 'LaTeX-mode-hook 'rainbow-delimiters-mode)
(setq TeX-electric-sub-and-superscript t)
(setq TeX-PDF-mode t)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(setq TeX-source-correlate-method 'synctex)
(add-hook 'LaTeX-mode-hook 'TeX-source-correlate-mode)
(add-hook 'LaTeX-mode-hook
          (lambda ()
            (LaTeX-add-environments
             '("exmp" LaTeX-env-label)
             '("defn" LaTeX-env-label)
             '("thm" LaTeX-env-label))))
(setq-default TeX-master nil)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)
(setq TeX-view-program-list '(("OS X Preview" "open %o")))
(setq TeX-view-program-selection '((output-pdf "OS X Preview")))



(setq TeX-parse-self t)
(setq TeX-auto-save t)
(setq LaTeX-command-style '(("" "%(PDF)%(latex) -file-line-error %S%(PDFout)")))

(require 'projectile)
(require 'flx-ido)
(global-flycheck-mode)
(global-rainbow-delimiters-mode)
(projectile-global-mode)
(electric-layout-mode)
;; (electric-indent-mode)
(electric-pair-mode)
(setq yas/triggers-in-field t);
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(require 'ess-site)
(require 'yasnippet) ;; not yasnippet-bundle
(yas-global-mode 1)
(add-hook 'jade-mode-hook (lambda ()
                            (setq yas/dont-activate t)))
(add-hook 'org-mode-hook
          #'(lambda ()
              (setq yas/fallback-behavior
                    `(apply ,(lookup-key org-mode-map [tab])))
              (local-set-key [tab] 'yas/expand)
              (define-key yas/keymap [tab] 'yas/next-field-or-maybe-expand)))

;; disable auto-save and auto-backup
(setq auto-save-default nil)
(setq make-backup-files nil)

(setq ido-use-faces nil)

;; open gist page on github
(setq gist-view-gist t)

;; Python
(require 'nose)
(require 'python-mode)
(setq py-split-windows-on-execute-p nil)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)
(setq jedi:complete-on-dot t)

;; ESS
(setq ess-nuke-trailing-whitespace-p t)

(defun iwb ()
  "indent whole buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))


(defun iy-tab-noconflict ()
  (let ((command (key-binding [tab]))) ; remember command
    (local-unset-key [tab]) ; unset from (kbd "<tab>")
    (local-set-key (kbd "TAB") command))) ; bind to (kbd "TAB")

(defun comment-or-uncomment-region-or-line ()
  "Comments or uncomments the region or the current line if there's no active region."
  (interactive)
  (let (beg end)
    (if (region-active-p)
        (setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position)))
    (comment-or-uncomment-region beg end)
    (next-logical-line)))

(global-set-key (kbd "C-\\") 'comment-or-uncomment-region-or-line)
(global-set-key (kbd "C-c w") 'whitespace-cleanup)
(global-set-key (kbd "C-c s") 'god-mode-all)
(add-hook 'ruby-mode-hook 'iy-tab-noconflict)
(add-hook 'markdown-mode-hook 'iy-tab-noconflict)
(add-hook 'org-mode-hook 'iy-tab-noconflict)

(defun toggle-frame-split ()
    "If the frame is split vertically, split it horizontally or vice versa.
Assumes that the frame is only split into two."
    (interactive)
    (unless (= (length (window-list)) 2) (error "Can only toggle a frame split in two"))
    (let ((split-vertically-p (window-combined-p)))
      (delete-window) ; closes current window
      (if split-vertically-p
          (split-window-horizontally)
              (split-window-vertically)) ; gives us a split with the
                                        ; other window twice
          (switch-to-buffer nil))) ; restore the original window in
                                        ; this part of the frame


(defun rotate-windows ()
  "Rotate your windows"
  (interactive)
  (cond
   ((not (> (count-windows) 1))
    (message "You can't rotate a single window!"))
   (t
    (let ((i 0)
          (num-windows (count-windows)))
      (while  (< i (- num-windows 1))
        (let* ((w1 (elt (window-list) i))
               (w2 (elt (window-list) (% (+ i 1) num-windows)))
               (b1 (window-buffer w1))
               (b2 (window-buffer w2))
               (s1 (window-start w1))
               (s2 (window-start w2)))
          (set-window-buffer w1 b2)
          (set-window-buffer w2 b1)
          (set-window-start w1 s2)
          (set-window-start w2 s1)
          (setq i (1+ i))))))))

;; ;; I don't use the default binding of 'C-x 5', so use
;; ;; toggle-frame-split instead
(global-set-key (kbd "C-x 5") 'toggle-frame-split)
(global-set-key (kbd "C-x 6") 'rotate-windows)

;;; (provide '01-tulloch)
;;; 01-tulloch.el ends here
