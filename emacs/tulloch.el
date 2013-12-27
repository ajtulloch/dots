; https://sites.google.com/site/steveyegge2/effective-emacs

(defun golang-config () 
  (add-to-list 'load-path "/usr/local/go/misc/emacs" t)
  (add-to-list 'load-path "~/Code/go/src/github.com/nsf/gocode/emacs" t)
  (require 'go-autocomplete)
  (require 'auto-complete-config)
  (require 'go-mode-load)
  (add-hook 'go-mode-hook (lambda ()
                            (local-set-key (kbd "\C-c\C-r") 'go-remove-unused-imports)))
  (add-hook 'go-mode-hook (lambda ()
                            (local-set-key (kbd "\C-ci") 'go-goto-imports)))
  (add-hook 'before-save-hook 'gofmt-before-save))

(defun orgmode-config ()
  (setq org-default-notes-file "~/notes.org")
  (define-key global-map "\C-cc" 'org-capture)
  (setq org-mobile-directory "~/Dropbox/MobileOrg")
  (global-set-key "\C-ca" 'org-agenda))

(defun haskell-config ()
  (setq haskell-stylish-on-save t)
  (setq haskell-font-lock-symbols t)) 

(defun shortcuts-config ()
  (smex-initialize)
  (global-set-key "\C-x\C-m" 'smex)
  (global-set-key "\C-c\C-m" 'smex)
  
  (global-set-key "\C-w" 'backward-kill-word)
  (global-set-key "\C-c\C-g" 'magit-status)
  (global-set-key "\C-x\C-k" 'kill-region)
  (global-set-key "\C-c\C-k" 'kill-region)
  ;; Never use this function (goal-set-column)
  (global-unset-key "\C-x\C-n")


  (defalias 'qrr 'query-replace-regexp)
  (global-set-key [f5] 'call-last-kbd-macro)
  (global-set-key [f7] 'compile)
  (add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode)))

(defun markdown-config ()  (add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
  (add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
  (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
  (add-hook 'markdown-mode 'longlines-mode))

(defun style-config ()
  (require 'color-theme-solarized)
  (color-theme-solarized-dark))

(defun clojure-config ()
  (require 'cider)
  (add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)

  (eval-after-load "auto-complete"
    '(add-to-list 'ac-modes 'nrepl-mode))
  (add-hook 'clojure-mode-hook 'paredit-mode)
  (add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'nrepl-mode-hook 'rainbow-delimiters-mode)

  (add-hook 'emacs-lisp-mode-hook 'paredit-mode)
  (add-hook 'eval-expression-minibuffer-setup-hook 'paredit-mode)
  (add-hook 'ielm-mode-hook 'paredit-mode)
  (add-hook 'lisp-mode-hook 'paredit-mode)
  (add-hook 'lisp-interaction-mode-hook 'paredit-mode)
  (add-hook 'scheme-mode-hook 'paredit-mode)

  (add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'eval-expression-minibuffer-setup-hook 'rainbow-delimiters-mode)
  (add-hook 'ielm-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'lisp-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'lisp-interaction-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'scheme-mode-hook 'rainbow-delimiters-mode)
)

(defun c++-config ()
  (require 'google-c-style)
  (add-hook 'c-mode-common-hook 'google-set-c-style)
  ;;
  ;; If you want the RETURN key to go to the next line and space over
  ;; to the right place, add this to your .emacs right after the
  ;; load-file:
  ;;
  (add-hook 'c-mode-common-hook 'google-make-newline-indent))

(defun latex-config ()
  (add-hook 'LaTeX-mode-hook (lambda ()
                               (TeX-run-style-hooks "amsmath" "amsthm" "latex2e")))
  (add-hook 'LaTeX-mode-hook (lambda ()
                               (TeX-fold-mode 1)))
  (add-hook 'LaTeX-mode-hook
            '(lambda ()
               (define-key LaTeX-mode-map (kbd "$") 'self-insert-command)))
  (add-hook 'LaTeX-mode-hook 'electric-pair-mode)
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
  (setq LaTeX-command-style '(("" "%(PDF)%(latex) -file-line-error %S%(PDFout)"))))

(defun global-config () 
  (require 'projectile)
  (require 'flx-ido)
  (global-flycheck-mode)
  (projectile-global-mode)
  (ido-mode 1)
  (ido-everywhere 1)
  (flx-ido-mode 1)
  ;; disable ido faces to see flx highlights.
  (require 'ess-site)
  (require 'yasnippet) ;; not yasnippet-bundle
  (yas-global-mode 1)
  (add-hook 'jade-mode-hook (lambda ()
                              (setq yas/dont-activate t)))

  ;; disable auto-save and auto-backup
  (setq auto-save-default nil)
  (setq make-backup-files nil)

  (setq ido-use-faces nil))

(defun python-config ()
  (require 'nose)
  (add-hook 'python-mode-hook 'jedi:setup)
  (setq jedi:setup-keys t)
  (setq jedi:complete-on-dot t))

(defun r-config ()
  (setq ess-nuke-trailing-whitespace-p t))

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

(add-hook 'ruby-mode-hook 'iy-tab-noconflict)
(add-hook 'markdown-mode-hook 'iy-tab-noconflict)
(add-hook 'org-mode-hook 'iy-tab-noconflict)

(add-hook 'after-init-hook 
          (lambda () 
            (progn
              (require 'auto-complete-config)
              (ac-config-default)
              (global-config)
              (golang-config)
              (orgmode-config)
              (clojure-config)
              (haskell-config)
              (shortcuts-config)
              (markdown-config)
              (c++-config)
              (python-config)
              (style-config)
              (latex-config))))
