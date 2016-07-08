;;; strace-mode.el --- strace output syntax highlighting
;; COPYRIGHT © 2016, by Preston Moore

;; Author: Preston Moore (prestonkmoore@gmail.com)
;; Version: 0.0.1
;; Keywords: languages

;; This file is not part of GNU Emacs.

;;; License:


;;; Commentary:

;; strace syntax highlighting

;; strace syntax highlighting


;;; Code:

;; create the list for font-lock.
;; each category of keyword is given a particular face
(setq strace-font-lock-keywords `(
                                  ("^\\([0-9]+\\) " . (1 font-lock-warning-face))
                                  ("^[0-9]+ \\([a-zA-Z0-9_]*\\)(" . (1 font-lock-constant-face))
                                  (" = \\(0x[[:xdigit:]]+\\).*$" . (1 font-lock-type-face))
                                  (" = \\(-?[[:digit:]?]+\\).*$" . (1 font-lock-type-face))
                                  (" = 0x[[:xdigit:]]+ \\([[:upper:]]+\\).*$" . (1 font-lock-negation-char-face))
                                  (" = -?[[:digit:]?]+ \\([[:upper:]]+\\).*$" . (1 font-lock-negation-char-face))
                                  (" \\((.*)\\)$" . (1 font-lock-comment-face))
                                  ("0x[[:xdigit:]]+" . font-lock-type-face)
                                  ("-?[[:digit:]]+" . font-lock-type-face)
                                  )
)

;;;###autoload
(define-derived-mode strace-mode fundamental-mode
  "strace mode"
  "Major mode for strace output"

  ;; code for syntax highlighting
  (setq font-lock-defaults '((strace-font-lock-keywords))))

;; add the mode to the `features' list
(provide 'strace-mode)

;; Local Variables:
;; coding: utf-8
;; End:

;;; strace-mode.el ends here
