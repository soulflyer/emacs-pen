(require 'package)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

(package-install 'elisp-slime-nav)
(package-install 'clojure-mode)
(package-install 'cider)
(package-install 'spinner)
(package-install 'counsel)
(package-install 'paradox)
;; smex stores history for minibuffer command completion
(package-install 'smex)
(package-install 'rainbow-delimiters)

(provide 'packages)
;;; packages.el ends here
