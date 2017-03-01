(use-package org
  :defer t
  :config
  (require 'org)
  (require 'ob-latex)
  (require 'ox-latex)
  (require 'elec-pair)

  (add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

  (defun fb-insert-diff (diff)
    "Insert a link to the DIFF."
    (interactive "sDiff ID: ")
    (insert (format "[[http://phabricator.fb.com/%s][%s]]" diff diff)))

  (defun fb-insert-task (task)
    "Insert a link to the TASK."
    (interactive "sTask ID: ")
    (insert (format "[[https://our.intern.facebook.com/intern/tasks/?t=%s][t%s]]" task task)))

  (setq org-src-fontify-natively t)
  (setq org-confirm-babel-evaluate nil)
  (setq org-latex-tables-booktabs t)
  (setq org-latex-listings 'minted)
  (setq org-latex-pdf-process '("rm %o/*.fls %o/*.fdb_latexmk || true && latexmk -pdflatex='xelatex -shell-escape' -f -pdf -quiet %f"))
  (setq org-latex-with-hyperref nil)
  (setq org-latex-minted-options '(("frame" "lines")))
  (setq org-latex-default-packages-alist
        '(("AUTO" "inputenc" t)
          ("" "fontspec" t)
          ("" "wrapfig" t)
          ("onehalfspacing" "setspace" t)
          ("" "amssymb" t)
          ("" "fullpage" t)
          ("" "minted" t)
          ("" "booktabs" t)
          ("normalem" "ulem" t)
          ("" "listings" t)
          ("" "hyperref"  t)))
  (add-to-list 'org-latex-classes
               '("tulloch-article"
                 "\\documentclass[a4,oneside,11pt]{article}
[DEFAULT-PACKAGES]
[PACKAGES]
[EXTRA]
\\setsansfont[Mapping=tex-text]{Helvetica Neue}
\\setmonofont[Mapping=tex-text,Scale=0.85]{Source Code Pro Light}
\\setromanfont[Mapping=tex-text,Numbers=OldStyle]{Helvetica Neue}
\\lstset{basicstyle=\\footnotesize\\ttfamily,breaklines=true}
\\onehalfspacing
\\hypersetup{colorlinks=true}"
         ("\\section{%s}" . "\\section*{%s}")
         ("\\subsection{%s}" . "\\subsection*{%s}")
         ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
         ("\\paragraph{%s}" . "\\paragraph*{%s}")
         ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

(add-to-list 'org-latex-classes
             '("tulloch-book"
               "\\documentclass[a4,oneside,11pt]{memoir}
[DEFAULT-PACKAGES]
[PACKAGES]
[EXTRA]
\\setsansfont[Mapping=tex-text]{Helvetica Neue}
\\setmonofont[Mapping=tex-text,Scale=0.85]{Source Code Pro Light}
\\setromanfont[Mapping=tex-text,Numbers=OldStyle]{Helvetica Neue}
\\lstset{basicstyle=\\footnotesize\\ttfamily,breaklines=true}
\\DoubleSpacing
\\hypersetup{colorlinks=true}"
         ("\\part{%s}" . "\\part*{%s}")
         ("\\chapter{%s}" . "\\chapter*{%s}")
         ("\\section{%s}" . "\\section*{%s}")
         ("\\subsection{%s}" . "\\subsection*{%s}")
         ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
         ("\\paragraph{%s}" . "\\paragraph*{%s}")
         ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))


;;; Notes
(setq org-default-notes-file (concat org-directory "/notes.org"))
;; any headline with level <= 2 is a target
(setq org-refile-targets '((org-agenda-files :maxlevel . 2)))

(setq org-publish-project-alist
      '(("org"
         :base-directory "~/org/"
         :recursive t
         :publishing-directory "~/public_html"
         :publishing-function org-html-publish-to-html
         :section-numbers 2
         ;; :with-toc nil
         :html-head "<link rel=\"stylesheet\"
                           href=\"solarized-light.css\"
                           type=\"text/css\"/>")

        ("other"
         :base-directory "~/org/"
         :recursive t
         :base-extension "css"
         :publishing-directory "~/public_html"
         :publishing-function org-publish-attachment)

        ("org-pdf"
         :base-directory "~/org/"
         :recursive t
         :publishing-directory "~/public_html"
         :publishing-function org-latex-publish-to-pdf)

        ("se4ml"
         :base-directory "~/src/se4ml/"
         :recursive nil
         :publishing-directory "~/src/se4ml/build/"
         :publishing-function org-latex-publish-to-pdf)))


(add-hook 'org-mode-hook
          (lambda ()
            (local-set-key (kbd "M-j") 'org-insert-heading)
            (local-set-key (kbd "C-c d") 'fb-insert-diff)
            (local-set-key (kbd "C-c t") 'fb-insert-task)
            (org-indent-mode)))

(defvar org-electric-pairs '((?= . ?=) (?$ . ?$)) "Electric pairs for `org-mode'.")

(defun org-add-electric-pairs ()
  "Add =, $ as electric pairs."
  (setq-local electric-pair-pairs (append electric-pair-pairs org-electric-pairs))
  (setq-local electric-pair-text-pairs electric-pair-pairs))

(add-hook 'org-mode-hook 'org-add-electric-pairs))

(use-package tramp
  :defer t
  :config
  (setq tramp-default-method "sshx")
  (setq
   tramp-password-prompt-regexp
   (concat
    "^.*"
    (regexp-opt
     '("passcode" "Passcode"
       "password" "Password") t)
    ".*:\0? *")))
