(defun load-config-file (f-name)
  "Load the config file with name"
  (let* ((config-dir "~/.emacs.d/config/"))
    (load-file (concat config-dir f-name))))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(add-to-list 'load-path "/usr/share/emacs/site-lisp/emacs-goodies-el/")

(load-config-file "packages.el")
(load-config-file "bindings.el")
(load-config-file "blackbored.el")
(load-config-file "core.el")
