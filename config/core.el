;; This is to help stop emacs splitting windows.
(setq split-window-preferred-function 'split-window-sensibly)
(setq pop-up-windows nil)

;; Start with a decent black background.
(color-theme-blackbored)

;;Highlight the current line
(global-hl-line-mode 1)

(require 'ls-lisp)
(setq ls-lisp-use-insert-directory-program nil)
(setq ls-lisp-verbosity '(uid))
