;;;########################################
;;; web-mode setting
;;;########################################
(require 'web-mode)

(add-to-list 'auto-mode-alist '("\\.jsp$"       . web-mode))
;;(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?$"     . web-mode))

;; (require 'flycheck)
;; (flycheck-add-mode 'javascript-eslint 'web-mode)
(setq-default indent-tabs-mode nil)
(defun web-mode-hook ()
  "Hooks for Web mode."

  ;; indent
  (setq web-mode-html-offset   2)
  (setq web-mode-style-padding 2)
  (setq web-mode-css-offset    2)
  (setq web-mode-script-offset 2)
  (setq web-mode-java-offset   2)
  (setq web-mode-asp-offset    2)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)

  (local-set-key (kbd "C-m") 'newline-and-indent)
  
  ;; auto tag closing
  ;0=no auto-closing
  ;1=auto-close with </
  ;2=auto-close with > and </
  (setq web-mode-tag-auto-close-style 2)
)

;; 一旦jsxはrjsx-modeを使ってみる
;; for better jsx syntax-highlighting in web-mode
;; - courtesy of Patrick @halbtuerke
;; (defadvice web-mode-highlight-part (around tweak-jsx activate)
;;   (if (equal web-mode-content-type "jsx")
;;     (let ((web-mode-enable-part-face nil))
;;       ad-do-it)
;;     ad-do-it))
;; (add-hook 'web-mode-hook 'web-mode-hook)

;; scss mode Settings
(add-hook 'scss-mode-hook 
      '(lambda() 
         (setq css-indent-offset 2)
         (setq indent-tabs-mode nil)))
