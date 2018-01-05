(require 'yasnippet)
(yas/load-directory "~/.emacs.d/snippets")
(yas-global-mode 1)


(add-to-list 'load-path "~/.emacs.d/es6-snippets")
(require 'es6-snippets)

;; auto-complete
;;; ベースとなるソースを指定

;; (defvar my-ac-sources
;;               '(ac-source-yasnippet
;;                 ac-source-abbrev
;;                 ac-source-dictionary
;;                 ac-source-words-in-same-mode-buffers))
;; (setq-default ac-sources '(ac-source-filename my-ac-sources))
(yas-global-mode 1)
(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-sources 'ac-source-yasnippet)
(add-to-list 'ac-modes 'rjsx-mode)

(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key yas-minor-mode-map (kbd "<C-tab>") 'yas-expand)

;; 既存スニペットを挿入する
(define-key yas-minor-mode-map (kbd "C-x i i") 'yas-insert-snippet)
;; 新規スニペットを作成するバッファを用意する
(define-key yas-minor-mode-map (kbd "C-x i n") 'yas-new-snippet)
;; 既存スニペットを閲覧・編集する
(define-key yas-minor-mode-map (kbd "C-x i v") 'yas-visit-snippet-file)
