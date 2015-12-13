(global-set-key (kbd "C-c w") 'whitespace-cleanup)
(global-set-key (kbd "C-x C-m") 'helm-M-x)
(global-set-key (kbd "C-c C-m") 'helm-M-x)
(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key [remap goto-line] 'goto-line-with-feedback)
(global-set-key (kbd "C-c SPC") 'ace-jump-mode)
(global-set-key (kbd "C-x C-k") 'kill-region)
(global-set-key (kbd "C-c C-k") 'kill-region)
(global-set-key (kbd "C-c C-g") 'magit-status)
(global-set-key (kbd "C-x 5") 'toggle-frame-split)
(global-set-key (kbd "C-c C-f") 'clang-format)

(add-hook 'ido-setup-hook
          (lambda ()
            ;; Go straight home
            (define-key ido-file-completion-map
              (kbd "~")
              (lambda ()
                (interactive)
                (if (looking-back "/")
                    (insert "~/")
                  (call-interactively 'self-insert-command))))))

(global-set-key (kbd "M-j")
                (lambda ()
                  (interactive)
                  (forward-line -1)
                  (join-line -1)))
