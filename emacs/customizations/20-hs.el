;;; Haskell --- Summary
;;; Commentary:
;;; Code:

(add-hook 'haskell-mode-hook
          (lambda ()
            (electric-layout-mode -1)
            (electric-indent-mode -1)
            (turn-on-haskell-indent)
            (diminish 'haskell-indent-mode)))

(provide '20-hs)
;;; 20-hs.el ends here
