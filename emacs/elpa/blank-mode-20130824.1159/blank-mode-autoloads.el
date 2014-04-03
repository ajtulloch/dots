;;; blank-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (blank-cleanup-region blank-cleanup global-blank-toggle-options
;;;;;;  blank-toggle-options blank-mode) "blank-mode" "blank-mode.el"
;;;;;;  (21305 42463 0 0))
;;; Generated autoloads from blank-mode.el

(autoload 'blank-mode "blank-mode" "\
Toggle blank minor mode visualization (\"bl\" on modeline).

If ARG is null, toggle blank visualization.
If ARG is a number greater than zero, turn on visualization;
otherwise, turn off visualization.
Only useful with a windowing system.

\(fn &optional ARG)" t nil)

(autoload 'blank-toggle-options "blank-mode" "\
Toggle local `blank-mode' options.

If local blank-mode is off, toggle the option given by ARG and
turn on local blank-mode.

If local blank-mode is on, toggle the option given by ARG and
restart local blank-mode.

Interactively, it reads one of the following chars:

  CHAR	MEANING
   t	toggle TAB visualization
   s	toggle SPACE and HARD SPACE visualization
   r	toggle trailing blanks visualization
   b	toggle SPACEs before TAB visualization
   l	toggle \"long lines\" visualization
   L	toggle \"long lines\" tail visualization
   n	toggle NEWLINE visualization
   i	toggle indentation SPACEs visualization
   e	toggle empty line at bob and/or eob visualization
   a	toggle SPACEs after TAB visualization
   c	toggle color faces
   m	toggle visual mark
   x	restore `blank-chars' value
   z	restore `blank-style' value
   ?	display brief help

Non-interactively, ARG should be a symbol or a list of symbols.
The valid symbols are:

   tabs			toggle TAB visualization
   spaces		toggle SPACE and HARD SPACE visualization
   trailing		toggle trailing blanks visualization
   space-before-tab	toggle SPACEs before TAB visualization
   lines		toggle \"long lines\" visualization
   lines-tail		toggle \"long lines\" tail visualization
   newline		toggle NEWLINE visualization
   indentation		toggle indentation SPACEs visualization
   empty		toggle empty line at bob and/or eob visualization
   space-after-tab	toggle SPACEs after TAB visualization
   color		toggle color faces
   mark			toggle visual mark
   blank-chars		restore `blank-chars' value
   blank-style		restore `blank-style' value

Only useful with a windowing system.

\(fn ARG)" t nil)

(autoload 'global-blank-toggle-options "blank-mode" "\
Toggle global `blank-mode' options.

If global blank-mode is off, toggle the option given by ARG and
turn on global blank-mode.

If global blank-mode is on, toggle the option given by ARG and
restart global blank-mode.

Interactively, it reads one of the following chars:

  CHAR	MEANING
   t	toggle TAB visualization
   s	toggle SPACE and HARD SPACE visualization
   r	toggle trailing blanks visualization
   b	toggle SPACEs before TAB visualization
   l	toggle \"long lines\" visualization
   L	toggle \"long lines\" tail visualization
   n	toggle NEWLINE visualization
   i	toggle indentation SPACEs visualization
   e	toggle empty line at bob and/or eob visualization
   a	toggle SPACEs after TAB visualization
   c	toggle color faces
   m	toggle visual mark
   x	restore `blank-chars' value
   z	restore `blank-style' value
   ?	display brief help

Non-interactively, ARG should be a symbol or a list of symbols.
The valid symbols are:

   tabs			toggle TAB visualization
   spaces		toggle SPACE and HARD SPACE visualization
   trailing		toggle trailing blanks visualization
   space-before-tab	toggle SPACEs before TAB visualization
   lines		toggle \"long lines\" visualization
   lines-tail		toggle \"long lines\" tail visualization
   newline		toggle NEWLINE visualization
   indentation		toggle indentation SPACEs visualization
   empty		toggle empty line at bob and/or eob visualization
   space-after-tab	toggle SPACEs after TAB visualization
   color		toggle color faces
   mark			toggle visual mark
   blank-chars		restore `blank-chars' value
   blank-style		restore `blank-style' value

Only useful with a windowing system.

\(fn ARG)" t nil)

(autoload 'blank-cleanup "blank-mode" "\
Cleanup some blank problems in all buffer or at region.

It usually applies to the whole buffer, but in transient mark
mode when the mark is active, it applies to the region.  It also
applies to the region when it is not in transiente mark mode, the
mark is active and it was pressed `C-u' just before calling
`blank-cleanup' interactively.

See also `blank-cleanup-region'.

The problems, which are cleaned up, are:

1. empty lines at beginning of buffer.
2. empty lines at end of buffer.
   If `blank-chars' has `empty' as an element, remove all empty
   lines at beginning and/or end of buffer.

3. 8 or more SPACEs at beginning of line.
   If `blank-chars' has `indentation' as an element, replace 8 or
   more SPACEs at beginning of line by TABs.

4. SPACEs before TAB.
   If `blank-chars' has `space-before-tab' as an element, replace
   SPACEs by TABs.

5. SPACEs or TABs at end of line.
   If `blank-chars' has `trailing' as an element, remove all
   SPACEs or TABs at end of line.

6. 8 or more SPACEs after TAB.
   If `blank-chars' has `space-after-tab' as an element, replace
   SPACEs by TABs.

\(fn)" t nil)

(autoload 'blank-cleanup-region "blank-mode" "\
Cleanup some blank problems at region.

The problems, which are cleaned up, are:

1. 8 or more SPACEs at beginning of line.
   If `blank-chars' has `indentation' as an element, replace 8 or
   more SPACEs at beginning of line by TABs.

2. SPACEs before TAB.
   If `blank-chars' has `space-before-tab' as an element, replace
   SPACEs by TABs.

3. SPACEs or TABs at end of line.
   If `blank-chars' has `trailing' as an element, remove all
   SPACEs or TABs at end of line.

4. 8 or more SPACEs after TAB.
   If `blank-chars' has `space-after-tab' as an element, replace
   SPACEs by TABs.

\(fn START END)" t nil)

;;;***

;;;### (autoloads nil nil ("blank-mode-pkg.el") (21305 42463 529588
;;;;;;  0))

;;;***

(provide 'blank-mode-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; blank-mode-autoloads.el ends here
