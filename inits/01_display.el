(load-theme 'solarized-light t)
(add-hook 'after-make-frame-functions
          (lambda (frame)
            (let ((mode (if (display-graphic-p frame) 'light 'dark)))
              (set-frame-parameter frame 'background-mode mode)
              (set-terminal-parameter frame 'background-mode mode))
            (enable-theme 'solarized)))

 ;; 英語
 (set-face-attribute 'default nil
             :family "Menlo" ;; font
             :height 150)    ;; font size

;; 日本語
(set-fontset-font
 nil 'japanese-jisx0208
;; (font-spec :family "Hiragino Mincho Pro")) ;; font
 (font-spec :family "Hiragino Kaku Gothic ProN")) ;; font

(setq-default line-spacing 3)

;; frame size
(if (boundp 'window-system)
    (setq default-frame-alist
	  (append (list
		   '(top . 22)
		   '(left . 420)
		   '(width  . 150)
		   '(height .  60)
		   )
		  default-frame-alist)))
(setq initial-frame-alist default-frame-alist)

(setq default-tab-width 4)
;; 現在行を目立たせる
(global-hl-line-mode)
