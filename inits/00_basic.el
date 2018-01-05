(setq-default line-spacing 3)
(electric-pair-mode t)

;; マウスで選択するとコピーする Emacs 24 ではデフォルトが nil
(setq mouse-drag-copy-region t)

; 言語を日本語にする
(set-language-environment 'Japanese)

; 極力UTF-8とする
(prefer-coding-system 'utf-8)

;;コマンドキーとALTキーを逆にする
(setq ns-command-modifier (quote meta))
(setq ns-alternate-modifier (quote super))
(define-key global-map [ns-drag-file] 'ns-find-file)

(define-key global-map (kbd "RET") 'newline-and-indent)

;; スタートアップページを表示しない
(setq inhibit-startup-message t)

;;行表示
(require 'linum)
(setq linum-format "%5d")
(global-linum-mode t)      ; デフォルトで linum-mode を有効にする
(setq line-number-mode t)  ; ステータスバーに行数を表示

;; バックスラッシュを入力できるようにする
(define-key global-map [?¥] [?\\])  ;; ¥の代わりにバックスラッシュを入力する

(define-key global-map (kbd "C-z") 'undo)                 ; undo
(define-key global-map (kbd "M-?") 'help-for-help)        ; ヘルプ
(define-key global-map (kbd "C-c ;") 'comment-dwim) ; コメントアウト
(define-key global-map (kbd "M-C-g") 'grep)               ; grep


;;; 画像ファイルを表示
(auto-image-file-mode t)
;;; 対応する括弧を光らせる。
(show-paren-mode 1)
;;; ウィンドウ内に収まらないときだけ括弧内も光らせる。
(setq show-paren-style 'mixed)
;;; 現在行を目立たせる
(global-hl-line-mode)
(setq hl-line-face 'underline)
;;; カーソルの位置が何文字目かを表示する
(column-number-mode t)

;;; カーソルの位置が何行目かを表示する
(line-number-mode t)

;;; カーソルの場所を保存する
(require 'saveplace)
(setq-default save-place t)
;;; 行の先頭でC-kを一回押すだけで行全体を消去する
(setq kill-whole-line t)

;;; 最近開いたファイルを保存する数を増やす
(setq recentf-max-saved-items 10000)
;;; ediffを1ウィンドウで実行
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;;; diffのオプション
(setq diff-switches '("-u" "-p" "-N"))
;;; diredを便利にする
(require 'dired-x)

;;; diredから"r"でファイル名をインライン編集する
(require 'wdired)
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)


;;; 終了時にオートセーブファイルを消す
(setq delete-auto-save-files t)
;;; *.~ とかのバックアップファイルを作らない
(setq make-backup-files nil)
;;; .#* とかのバックアップファイルを作らない
(setq auto-save-default nil)
;;; 履歴数を大きくする
(setq history-length 10000)

;;; ミニバッファの履歴を保存する
(savehist-mode 1)

;; 問い合わせを簡略化 yes/no を y/n
(fset 'yes-or-no-p 'y-or-n-p)

;; バックアップファイルを作らない
(setq backup-inhibited t)
;; メニューバーを隠す
(tool-bar-mode -1)

;; バッファを一気に消す
(defun kill-other-buffers ()
    "Kill all other buffers."
    (interactive)
    (mapc 'kill-buffer 
          (delq (current-buffer) 
                (remove-if-not 'buffer-file-name (buffer-list)))))
(defun kill-all-buffers ()
  (interactive)
  (mapcar 'kill-buffer (buffer-list))
  (delete-other-windows))

(global-set-key (kbd "C-x K") 'kill-all-buffers)

;; パスをシェルから引き継ぐ
(exec-path-from-shell-initialize)
