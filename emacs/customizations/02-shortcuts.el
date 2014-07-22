;;; shortcuts --- Summary
;;; Commentary:
;;; Code:

(defun uniq-lines (start end)
  "Removes duplicate lines from the selected region."
  (interactive "*r")
  (goto-char start)
  (beginning-of-line)
  (let ((last ""))
    (while (< (point) end)
      (let* ((bol (point))
             (eol (progn (end-of-line) (point)))
             (text (buffer-substring bol eol)))
        (forward-char)
        (if (string= last text)
            (delete-region bol (point))
          (setq last text))))))

(defun rename-current-buffer-file ()
  "Renames current buffer and file it is visiting."
  (interactive)
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (let ((new-name (read-file-name "New name: " filename)))
        (if (get-buffer new-name)
            (error "A buffer named '%s' already exists!" new-name)
          (rename-file filename new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil)
          (message "File '%s' successfully renamed to '%s'"
                   name (file-name-nondirectory new-name)))))))

(defun iy-tab-noconflict ()
  "...?"
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


(defun toggle-frame-split ()
    "If the frame is split vertically, split it horizontally or vice versa.
Assumes that the frame is only split into two."
    (interactive)
    (unless (= (length (window-list)) 2)
      (error "Can only toggle a frame split in two"))
    (let ((split-vertically-p (window-combined-p)))
      (delete-window) ; closes current window
      (if split-vertically-p
          (split-window-horizontally)
              (split-window-vertically)) ; gives us a split with the
                                        ; other window twice
          (switch-to-buffer nil))) ; restore the original window in
                                        ; this part of the frame

(defun rotate-windows ()
  "Rotate your windows."
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


(defalias 'qrr 'query-replace-regexp)

(defun goto-line-with-feedback ()
  "Show line numbers temporarily, while prompting for the line number input."
  (interactive)
  (unwind-protect
      (progn
        (linum-mode 1)
        (goto-line (read-number "Goto line: ")))
    (linum-mode -1)))

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

(global-set-key [remap goto-line] 'goto-line-with-feedback)
(global-unset-key (kbd "C-x C-d"))
(global-set-key (kbd "C-x C-d") 'ido-dired)
(global-set-key (kbd "C-x C-m") 'smex)
(global-set-key (kbd "C-c C-m") 'smex)
(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "C-c C-g") 'magit-status)
(global-set-key (kbd "C-x C-k") 'kill-region)
(global-set-key (kbd "C-c C-k") 'kill-region)
(global-set-key [f5] 'call-last-kbd-macro)
(global-set-key [f7] 'compile)
(global-set-key (kbd "C-x 5") 'toggle-frame-split)
(global-set-key (kbd "C-x 6") 'rotate-windows)
(global-set-key (kbd "C-\\") 'comment-or-uncomment-region-or-line)
(global-set-key (kbd "C-c w") 'whitespace-cleanup)
(global-set-key (kbd "C-c s") 'god-mode-all)
(global-set-key (kbd "C-x C-r") 'rename-current-buffer-file)
(global-set-key (kbd "C-x p") 'switch-to-buffer-other-window)
(global-set-key (kbd "C-c C-j") 'next-error)
(global-set-key (kbd "C-C C-k") 'previous-error)
(global-set-key (kbd "C-c SPC") 'ace-jump-mode)
(global-set-key (kbd "C-c p g") 'projectile-grep)

(global-unset-key (kbd "\C-x\C-n"))
(global-unset-key (kbd "C-x m"))

(provide '02-shortcuts)
;;; 02-shortcuts.el ends here
