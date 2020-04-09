(load-theme 'solarized-light t)

(if (display-graphic-p)
  
    ;; X Window Settings
    (progn

      ;; 英語
      (set-face-attribute 'default nil
                          :family "Menlo" ;; font
                          :height 150)    ;; font size
      
      ;; 日本語
      (set-fontset-font nil 'japanese-jisx0208
                        ;; (font-spec :family "Hiragino Mincho Pro")) ;; font
                        (font-spec :family "Hiragino Kaku Gothic ProN")) ;; font

      (setq-default line-spacing 3)

      ;; frame size
      (setq default-frame-alist
            (append (list
                     '(top . 22)
                     '(left . 420)
                     '(width  . 150)
                     '(height .  60)
                     )
                    default-frame-alist))

      (setq initial-frame-alist default-frame-alist)

      ;; (setcdr (assoc "*rspec-compilation*" popwin:special-display-config) '(:dedicated t :position bottom :stick t :noselect nil :height 0.4))
1
      )

  ;; Terminal Settings
  (set-frame-parameter nil 'background-mode 'dark)
  (set-terminal-parameter nil 'background-mode 'dark)
)

;; popwin
(require 'popwin)
(popwin-mode 1)
(setq popwin:popup-window-position 'bottom)

(push '(dired-mode :position top) popwin:special-display-config)

                                        ; rspec
(push '("*rspec-compilation*" :dedicated t :position bottom :stick t :noselect nil :height 0.4) popwin:special-display-config)

;; Markdown
(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown")
  )

;; tree view
(setq neo-smart-open t)
(defun neotree-project-dir ()
  "Open NeoTree using the git root."
  (interactive)
  (let ((project-dir (projectile-project-root))
        (file-name (buffer-file-name)))
    (neotree-toggle)
    (if project-dir
        (if (neo-global--window-exists-p)
            (progn
              (neotree-dir project-dir)
              (neotree-find file-name)))
      (message "Could not find git project root."))))
(global-set-key [f8] 'neotree-project-dir)
(setq projectile-switch-project-action 'neotree-projectile-action)
;; neotree でファイルを新規作成した後、自動的にファイルを開く
(setq neo-create-file-auto-open t)


(setq default-tab-width 4)

;; 現在行を目立たせる
(global-hl-line-mode)

