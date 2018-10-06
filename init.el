(defun load-config-file (f-name)
  "Load the config file with name"
  (let* ((config-dir "~/.emacs.d/config/"))
    (load-file (concat config-dir f-name))))

(load-config-file "core.el")
(load-config-file "packages.el")
(load-config-file "bindings.el")
