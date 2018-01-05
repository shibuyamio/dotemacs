(require 'cl-lib)
(require 'edit-indirect)
(defvar edit-indirect-guess-mode-alist
  '(("styled\..+`\n?"  "`;" scss-mode)
	("<script.*>"  "</script.*>" js2-mode)
    ("<style.*>"  "</style.*>" css-mode))
  "(開始正規表現 終了正規表現 メジャーモード) のリスト。
開始正規表現の後から終了正規表現の前までが
edit-indirect-regionが適用されます。")
(defun edit-indirect-guess-mode-at-point ()
  (cl-loop with s
           with e
           with region-start
           with region-end
           with pt = (point)
           for (start end mode) in
           edit-indirect-guess-mode-alist
           when
           (save-excursion
             (setq s (re-search-backward start nil t)
                   region-start (match-end 0))
             (setq e (re-search-forward end nil t)
                   region-end (match-beginning 0))
             (and s e (< s pt e)))
           return (list mode region-start region-end)))
(defun edit-indirect-dwim (s e)
  (interactive "r")
  (let (it)
    (cond ((region-active-p)
           (edit-indirect-region s e t))
          ((setq it (edit-indirect-guess-mode-at-point))
           (edit-indirect-region (nth 1 it) (nth 2 it) t)
           (funcall (car it)))
          (t
           (user-error "No region")))))

(global-set-key (kbd "C-c d") 'edit-indirect-dwim)
