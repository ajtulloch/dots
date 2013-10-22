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
  (add-to-list `exec-path "~/.cabal/bin")
  (autoload 'ghc-init "ghc" nil t)
  (add-hook 'haskell-mode-hook (lambda () (ghc-init)))) 

(defun shortcuts-config ()
  (global-set-key "\C-x\C-m" 'execute-extended-command)
  (global-set-key "\C-c\C-m" 'execute-extended-command)
  (global-set-key "\C-w" 'backward-kill-word)
  (global-set-key "\C-c\C-g" 'magit-status)
  (global-set-key "\C-x\C-k" 'kill-region)
  (global-set-key "\C-c\C-k" 'kill-region)

  (defalias 'qrr 'query-replace-regexp)
  (global-set-key [f5] 'call-last-kbd-macro))

(defun style-config ()
  (require 'color-theme-solarized)
  (color-theme-solarized-dark)
  (setq linum-format "%2d ")

  (global-linum-mode))

(defun clojure-config ()
  (add-hook 'clojure-mode-hook
            (lambda ()
              (font-lock-mode nil)
              (clojure-font-lock-setup)
              (font-lock-mode t)))
  (add-hook 'nrepl-mode-hook 'ac-nrepl-setup)
  (add-hook 'nrepl-interaction-mode-hook 'ac-nrepl-setup)
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

  (add-hook 'nrepl-mode-hook 'paredit-mode))

(defun latex-config ()
  (add-hook 'LaTeX-mode-hook (lambda ()
                               (TeX-run-style-hooks "amsmath" "amsthm" "latex2e")))
  (add-hook 'LaTeX-mode-hook (lambda ()
                               (add-hook 'find-file-hook 'TeX-fold-buffer t)
                               (TeX-fold-mode 1)))

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
  (setq TeX-auto-save t))

(add-hook 'after-init-hook 
          (lambda () 
            (progn
              (require 'auto-complete-config)
              (ac-config-default)
              (golang-config)
              (orgmode-config)
              (clojure-config)
              (shortcuts-config)
              (style-config)
              (latex-config))))
