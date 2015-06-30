(require 'cask "/usr/local/opt/cask/cask.el")
(cask-initialize)

(require 'pallet)
(pallet-mode t)

(require 'use-package)

(require 'init-loader)
(custom-set-variables
 '(init-loader-show-log-after-init 'error-only))
 (init-loader-load (concat user-emacs-directory "inits"))
