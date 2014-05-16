;; (global-linum-mode 1)

;; (defadvice linum-update-window (around linum-dynamic activate)
;;   (let* ((w (length (number-to-string
;;                      (count-lines (point-min) (point-max)))))
;;          (linum-format (concat " %" (number-to-string w) "d ")))
;;     ad-do-it))
;; (require 'linum-off)
;; (require 'hlinum)
;; (hlinum-activate)

;; (fringe-mode -1)
