;; This is to help stop emacs splitting windows.
(setq split-window-preferred-function 'split-window-sensibly)
(setq pop-up-windows nil)

;; Start with a decent black background.
(color-theme-blackbored)

;;Highlight the current line
(global-hl-line-mode 1)

;; Tidy up dired display
(require 'ls-lisp)
(setq ls-lisp-use-insert-directory-program nil)
(setq ls-lisp-verbosity '(uid))

;; TODO Tidy up ibuffer display next
(setq ibuffer-formats '((mark modified read-only " "
                              (size 5 -1 :left :elide)
                              (name))
                        (mark filename)))

(menu-bar-mode -1)
