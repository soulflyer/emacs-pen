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
;; Specify a directory for themes and load one that has some nice colours
;; ======================================================================
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme  'blackbored)

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

;; use-package lets us define commands to run when a package is loaded
;; which makes it neater to set up the commands for a package.
(when (not (package-installed-p 'use-package))
  (package-install 'use-package))
(require 'use-package)
(require 'use-package-ensure)

;; paradox makes updating packages easier
(require 'paradox)
(paradox-enable)

;; ============================================================
;; Use counsel and which-key to help find and remember commands
;; ============================================================
(require 'iw-counsel)
(require 'iw-which-key)

;; =====================
;; Tidy up dired display
;; =====================
(require 'iw-dired)

;; ======================
;; Tidy up buffer display
;; ======================
(setq-default ibuffer-formats
              '((mark modified read-only " "
                      (size 5 -1 :left :elide)
                      (name))
                (mark filename)))
(global-set-key (kbd "C-x C-b") 'ibuffer)


(provide 'init)
;;; init.el ends here
