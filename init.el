;;; init.el --- Emacs setup starts here.             -*- lexical-binding: t; -*-
;; Copyright (C) 2021  Iain Wood
;; Author: Iain Wood <iain@soulflyer.co.uk>
;;; Commentary:
;;
;;; Code:

;; ==================================================================================
;; if we add the config directory to load-path then we can 'require' files from there
;; ==================================================================================
(add-to-list 'load-path              "~/.emacs.d/config")

;; ======================================================================
;; custom-file tells emacs where to store any customizations made through
;; the 'customize' commands like M-x customize-group
;; ======================================================================
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; =====================================================
;; Set up some stuff for adding extra packages to Emacs.
;; =====================================================
(require 'package)
;;Add melpa, there are lots of useful packages there.
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
;; paradox makes updating packages easier
(package-install 'paradox)
(paradox-enable)

;; =====================
;; Tidy up dired display
;; =====================
(require 'ls-lisp)
(setq ls-lisp-use-insert-directory-program nil)
(setq ls-lisp-verbosity '(uid))

;; ======================
;; Tidy up buffer display
;; ======================
(setq-default ibuffer-formats
              '((mark modified read-only " "
                      (size 5 -1 :left :elide)
                      (name))
                (mark filename)))
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; ============================================================
;; Use counsel and which-key to help find and remember commands
;; ============================================================
(package-install 'counsel)
(package-install 'which-key)
(global-set-key (kbd "M-x") 'counsel-M-x)

(provide 'init)
;;; init.el ends here
