(require 'rbenv)
(setq rbenv-installation-dir "/usr/local/bin/rbenv")
(global-rbenv-mode)
(setq rbenv-modeline-function 'rbenv--modeline-plain)

(setq ruby-insert-encoding-magic-comment nil)

(add-to-list 'electric-pair-pairs '(?| . ?|))


(autoload 'ruby-mode "ruby-mode"
  "Mode for editing ruby source files" t)
(add-to-list 'auto-mode-alist '("\\.rb$latex " . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '(".steps$" . ruby-mode))

;; helm-gtags
(add-hook 'ruby-mode-hook 'helm-gtags-mode)

(require 'ruby-electric)
(add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))
(setq ruby-electric-expand-delimiters-list nil)

;; ruby-block.el --- highlight matching block
(require 'ruby-block)
(ruby-block-mode t)
(setq ruby-block-highlight-toggle t)

;; (require 'rubocop)
;; (add-hook 'ruby-mode-hook 'rubocop-mode)

 ; robe
(add-hook 'ruby-mode-hook 'robe-mode)
(autoload 'robe-mode "robe" "Code navigation, documentation lookup and completion for Ruby" t nil)
(autoload 'ac-robe-setup "ac-robe" "auto-complete robe" nil nil)
(add-hook 'robe-mode-hook 'ac-robe-setup)

;; ;; rinari
;; (add-hook 'ruby-mode-hook (lambda() (rinari-launch)))
;; (setq rinari-tags-file-name "TAGS")
;; (add-hook 'rhtml-mode-hook
;;     (lambda ()
;;       (rinari-launch)
;;       (abbrev-mode nil) 
;;       ))

;; Interactively Do Things
(require 'ido)
(ido-mode t)

(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

;; rspec-mode
(require 'rspec-mode)
(add-hook 'ruby-mode-hook 'rspec-mode)
(eval-after-load 'rspec-mode
  '(rspec-install-snippets))
(add-hook 'after-init-hook 'inf-ruby-switch-setup)

;; project管理
(projectile-rails-global-mode)

;; リファクタリング
(add-hook 'ruby-mode-hook 'ruby-refactor-mode-launch)
