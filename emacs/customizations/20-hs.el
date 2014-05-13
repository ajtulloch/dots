;;; Haskell --- Summary
;;; Commentary:
;;; Code:

(add-hook 'haskell-mode-hook
          (lambda ()
            (electric-layout-mode -1)
            (electric-indent-mode -1)
            (turn-on-haskell-indent)))
;; (set-face-background 'shm-current-face "ac-selection-face")
;; (set-face-background 'shm-quarantine-face "lemonchiffon")

(provide '20-hs)
;;; 20-hs.el ends here
