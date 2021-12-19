;;; iw-clojure.el --- setup clojure                  -*- lexical-binding: t; -*-
;; Copyright (C) 2020  Iain Wood
;; Author: Iain Wood <iain@soulflyer.co.uk>
;;; Commentary:

;;; Code:
(require 'use-package)
(use-package clojure-mode
  :ensure t
  :init
  (setq clojure-indent-style :align-arguments)

  :config
  :bind (("C-c C-x C-j j"    . 'cider-jack-in-clj)
         ("C-c C-x C-j C-j"  . 'cider-jack-in-clj)
         ("C-c C-x C-j s"    . 'cider-jack-in-cljs)
         ("C-c C-x C-j C-s"  . 'cider-jack-in-cljs)
         ("C-c C-x C-j RET"  . 'cider-jack-in-clj&cljs)
         :map clojure-mode-map
         ("C-c c m"   . 'clojure-convert-collection-to-map)
         ("C-c c v"   . 'clojure-convert-collection-to-vector)
         ("C-c c l"   . 'clojure-convert-collection-to-list)
         ("C-c c s"   . 'clojure-convert-collection-to-set)
         ("C-c c {"   . 'clojure-convert-collection-to-map)
         ("C-c c ["   . 'clojure-convert-collection-to-vector)
         ("C-c c '"   . 'clojure-convert-collection-to-quoted-list)
         ("C-c c ("   . 'clojure-convert-collection-to-list)
         ("C-c c #"   . 'clojure-convert-collection-to-set)))

(use-package cider
  :ensure t
  :bind (:map
         cider-mode-map
         ("M-RET" . 'cider-doc)
         :map cider-repl-mode-map
         ("M-RET" . 'cider-doc)
         ("C-c q" . 'cider-quit)
         ("C-c h" . 'cider-browse-ns-all))
  :init
  (add-hook 'cider-repl-mode-hook #'(lambda () (setq scroll-conservatively 101)))
  
  :bind (:map
         cider-repl-mode-map
         ("S-<up>"   . 'cider-repl-previous-input)
         ("S-<down>" . 'cider-repl-next-input)))


(use-package cljr-ivy
  :ensure t)

(provide 'iw-clojure)
;;; iw-clojure.el ends here
