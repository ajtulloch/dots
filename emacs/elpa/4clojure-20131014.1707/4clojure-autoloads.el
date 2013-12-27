;;; 4clojure-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (4clojure-check-answers 4clojure-previous-question
;;;;;;  4clojure-next-question 4clojure-open-question) "4clojure"
;;;;;;  "4clojure.el" (21131 24570 0 0))
;;; Generated autoloads from 4clojure.el

(autoload '4clojure-open-question "4clojure" "\
Opens a 4clojure problem in an aptly named buffer

\(fn PROBLEM-NUMBER)" t nil)

(autoload '4clojure-next-question "4clojure" "\
Gets the next 4clojure question or 1st question based on the current buffer
name

\(fn)" t nil)

(autoload '4clojure-previous-question "4clojure" "\
Opens the previous 4clojure question or 1st question based on the current
buffer name

\(fn)" t nil)

(autoload '4clojure-check-answers "4clojure" "\
Sends the first answer to 4clojure and gets a message back

\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("4clojure-pkg.el") (21131 24570 742282
;;;;;;  0))

;;;***

(provide '4clojure-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; 4clojure-autoloads.el ends here
