;;; cpp --- Summary
;;; Commentary:
;;; Code:

(require 'google-c-style)
(add-to-list 'auto-mode-alist '("\\.cu\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cuh\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-hook 'c-mode-common-hook
          (lambda ()
            (c-toggle-auto-newline 1)
            (google-set-c-style)
            (google-make-newline-indent)
            (electric-pair-mode -1)))

(eval-after-load 'flycheck
  '(progn
     (require 'flycheck-google-cpplint)
     ;; Add Google C++ Style checker.
     ;; In default, syntax checked by Clang and Cppcheck.
     (flycheck-add-next-checker 'c/c++-cppcheck
                                '(warnings-only . c/c++-googlelint))))

(provide '20-cpp)
;;; 20-cpp.el ends here
