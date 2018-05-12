;; Syntacs check
(add-hook 'after-init-hook #'global-flycheck-mode)
(setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))

(use-package flycheck-jest
  :load-path "cloned-path"
  :ensure nil
  :config
  (flycheck-jest-setup))

(with-eval-after-load 'flycheck
  (flycheck-jest-setup))

;; JSONファイルではjson lint
(add-hook 'json-mode-hook
          '(lambda ()
             (setq flycheck-checker 'json-jsonlint)))


;; customize flycheck temp file prefix

;; (setq-default flycheck-temp-prefix ".flycheck")
;; ruby
(add-hook 'ruby-mode-hook
          '(lambda ()
             (setq flycheck-checker 'ruby-rubocop)
             (flycheck-mode 1)))
