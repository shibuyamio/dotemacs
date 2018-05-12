
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'cask "/usr/local/share/emacs/site-lisp/cask/cask.el")

(cask-initialize)

(require 'pallet)
(pallet-mode t)

(require 'use-package)

(require 'init-loader)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(helm-boring-file-regexp-list (quote ("~$" "\\.elc$")))
 '(helm-buffer-max-length 35)
 '(helm-command-prefix-key "C-@")
 '(helm-delete-minibuffer-contents-from-point t)
 '(helm-ff-skip-boring-files t)
 '(helm-ls-git-show-abs-or-relative (quote relative))
 '(helm-mini-default-sources
   (quote
    (helm-source-buffers-list helm-source-ls-git helm-source-recentf helm-source-buffer-not-found)))
 '(helm-truncate-lines t t)
 '(init-loader-show-log-after-init (quote error-only))
 '(js-indent-level 2)
 '(js2-basic-offset 2)
 '(package-selected-packages
   (quote
    (flycheck-jest migemo direnv color-theme-solarized edit-indirect yaml-mode wgrep-ag web-mode-edit-element web-beautify use-package tern solarized-theme smex smartrep smartparens smart-tabs-mode scss-mode sass-mode ruby-test-mode ruby-refactor ruby-electric ruby-block rubocop rspec-mode robe rjsx-mode rinari rhtml-mode redo+ react-snippets rbenv projectile-rails prodigy popwin phpunit php-scratch php-refactor-mode php+-mode pallet nyan-mode neotree multiple-cursors markdown-mode magit jsx-mode json-mode init-loader idle-highlight-mode htmlize helm-open-github helm-ls-git helm-gtags helm-descbinds helm-ag-r helm-ag flymake-json flycheck-cask feature-mode expand-region exec-path-from-shell drag-stuff coffee-mode cl-lib-highlight cake anzu ag ac-helm 0blayout)))
 '(rspec-bundle-p nil)
 '(rspec-use-bundler-when-possible nil)
 '(rspec-use-spring-when-possible nil))
 (init-loader-load (concat user-emacs-directory "inits"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(magit-diff-added ((t (:background "black" :foreground "green"))))
 '(magit-diff-added-highlight ((t (:background "white" :foreground "green"))))
 '(magit-diff-removed ((t (:background "black" :foreground "blue"))))
 '(magit-diff-removed-hightlight ((t (:background "white" :foreground "blue"))))
 '(magit-hash ((t (:foreground "red")))))
