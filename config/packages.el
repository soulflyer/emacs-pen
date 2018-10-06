(require 'package)

(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(package-initialize)

(package-install 'clojure-mode)
(package-install 'cider)
(package-install 'spinner)
