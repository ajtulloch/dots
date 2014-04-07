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


(global-set-key "\C-x\C-m" 'smex)
(global-set-key "\C-c\C-m" 'smex)
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-c\C-g" 'magit-status)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)
(global-unset-key "\C-x\C-n")
(defalias 'qrr 'query-replace-regexp)
(global-set-key [f5] 'call-last-kbd-macro)
(global-set-key [f7] 'compile)
(global-set-key (kbd "C-x 5") 'toggle-frame-split)
(global-set-key (kbd "C-x 6") 'rotate-windows)
(global-set-key (kbd "C-\\") 'comment-or-uncomment-region-or-line)
(global-set-key (kbd "C-c w") 'whitespace-cleanup)
(global-set-key (kbd "C-c s") 'god-mode-all)
