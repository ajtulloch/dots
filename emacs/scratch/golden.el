;;; Scratch --- ...
;;; Commentary:
;;; Code:

(defun golden-split ()
  "..."
  (interactive)
  (split-window-right)
  (split-window-below)
  (condition-case nil (golden-split) (error nil)))

(provide 'golden)
;;; golden.el ends here
