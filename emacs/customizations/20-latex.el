;;; LaTeX --- Summary
;;; Commentary:
;;; Code:
;; (require 'latex)
(add-hook 'LaTeX-mode-hook
          (lambda ()
            (TeX-run-style-hooks "amsmath" "amsthm" "latex2e")
            (TeX-fold-mode 1)
            (define-key LaTeX-mode-map (kbd "$") 'self-insert-command)
            (LaTeX-math-mode)
            (TeX-source-correlate-mode)
            (turn-on-reftex)
            (LaTeX-add-environments
             '("exmp" LaTeX-env-label)
             '("defn" LaTeX-env-label)
             '("thm" LaTeX-env-label))))

(provide '20-latex)
;;; 20-latex.el ends here
