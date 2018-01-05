;; Syntacs check
(add-hook 'after-init-hook #'global-flycheck-mode)
(setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))

;; eslintを優先
(eval-after-load 'flycheck
  '(lambda()
  '(custom-set-variables
    '(flycheck-disabled-checkers '(javascript-jshint javascript-jscs))
    )
  ))

;; JSONファイルではjson lint
(add-hook 'json-mode-hook
          '(lambda ()
             (setq flycheck-checker 'json-jsonlint)))

;; customize flycheck temp file prefix

(setq-default flycheck-temp-prefix ".flycheck")
;; ruby
(add-hook 'ruby-mode-hook
          '(lambda ()
             (setq flycheck-checker 'ruby-rubocop)
             (flycheck-mode 1)))
