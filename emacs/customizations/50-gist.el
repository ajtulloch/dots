;; -*- lexical-binding: t -*-
;;; Gist --- Summary
;;; Commentary:
;;; Code:

(require 'url)

(defvar gistio-format-string "http://www.mkdown.com/%s")
(defvar ipython-nbview-format-string "http://nbviewer.ipython.org/gist/%s")
(defvar gist-js-format-string
  "<script src=\"https://gist.github.com/%s.js\"></script>")

(defun gist-with (callback)
  (if (region-active-p)
      (gist-region-private (region-beginning) (region-end))
    (gist-buffer-private))
  (let* ((parsed (url-generic-parse-url (current-kill 0)))
         (gist-id (substring (url-filename parsed) 1)))
    (funcall callback gist-id)))

(defun open-gist-with-format-string (format-string)
  (lambda (gist-id)
    (let ((format-url (format format-string gist-id)))
      (message format-url)
      (browse-url format-url))))

(defun gistio ()
  (interactive)
  "Sends Markdown gist to gist.io for nicer visualization."
  (gist-with (open-gist-with-format-string
              gistio-format-string)))

(defun ipython-nbview ()
  "Sends ipython .ipynb to github and opens in nbviewer."
  (interactive)
  (gist-with (open-gist-with-format-string
              ipython-nbview-format-string)))

(defun embed-gist-js ()
  (interactive)
  (gist-with (lambda (gist-id)
               (let* ((script-str (format gist-js-format-string gist-id)))
                 (kill-new (message script-str))))))

;;; 50-gist.el ends here
