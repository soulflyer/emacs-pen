;;; iw-lisp.el --- Setup for lisp                    -*- lexical-binding: t; -*-

;;; Commentary:
;; Credit to Sam Aaron for describe thing at point.

;;; Code:
(defun live-lisp-describe-thing-at-point ()
  "Show the documentation of the Elisp function and variable near point.
This checks in turn:
-- for a function name where point is
-- for a variable name where point is
-- for a surrounding function call"
  (interactive)
  (let (sym)
    ;; sigh, function-at-point is too clever.  we want only the first half.
    (cond ((setq sym (ignore-errors
                       (with-syntax-table emacs-lisp-mode-syntax-table
                         (save-excursion
                           (or (not (zerop (skip-syntax-backward "_w")))
                               (eq (char-syntax (char-after (point))) ?w)
                               (eq (char-syntax (char-after (point))) ?_)
                               (forward-sexp -1))
                           (skip-chars-forward "`'")
                           (let ((obj (read (current-buffer))))
                             (and (symbolp obj) (fboundp obj) obj))))))
           (describe-function sym))
          ((setq sym (variable-at-point)) (describe-variable sym)))))

(define-key lisp-mode-shared-map  (kbd "M-RET")   'live-lisp-describe-thing-at-point)
;; Also handy for jumping to docs directly from an Info node
(require 'info)
(define-key Info-mode-map         (kbd "M-RET")   'live-lisp-describe-thing-at-point)


(provide 'iw-lisp)
;;; iw-lisp.el ends here