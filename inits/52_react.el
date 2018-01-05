(add-hook 'js-mode-hook 'js2-minor-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("components\\/.*\\.js\\'" . rjsx-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . json-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))
;; (add-to-list 'auto-mode-alist '("\\.jsx?\\'" . js2-jsx-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-jsx-mode))
;; (setq js-indent-level 2) ;;スペースは２つ、デフォルトは4
(setq coffee-tab-width 2)
;; (setq js-indent-level 2)
;; (setq js2-basic-offset 2)

(add-hook 'js2-mode-hook
      (lambda ()
        (tern-mode t)
        (local-set-key (kbd "-") (smartchr '(" - " " => " "-")))
		(setq indent-tabs-mode nil)
		(setq js-indent-level 2)
		(setq js2-basic-offset 2)
     ))
;(eval-after-load 'tern
;  '(progn
;     (require 'tern-auto-complete)
;     (tern-ac-setup)
;     ))
;;; (require 'flycheck)
;; (flycheck-add-mode 'javascript-eslint 'js2-jsx-mode)
(add-hook 'rjsx-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil) ;;インデントはタブではなくスペース
			(setq js-indent-level 2)
			(setq js2-basic-offset 2)
            (setq js2-strict-missing-semi-warning nil))) ;;行末のセミコロンの警告はオフ
(use-package web-mode
  :ensure t
  :config
    '(setq web-mode-code-indent-offset 2)
    '(setq web-mode-markup-indent-offset 2))
