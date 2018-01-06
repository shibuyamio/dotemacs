(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c a") 'org-agenda)

;; 見出しをインデントする
(setq org-startup-indented t)

;; 見出しをインデントした時にアスタリスクが減るのを防ぐ
(setq org-indent-mode-turns-on-hiding-stars nil)

;; インデントの幅を設定
(setq org-indent-indentation-per-level 4)

;; 見出しの初期状態（全て表示）
(setq org-startup-folded 'showall)

(setq org-mode-hook 'turn-on-auto-fill)

;; org-captureで2種類のメモを扱うようにする
(setq org-capture-templates
      '(("t" "New TODO" entry
         (file+headline "~/org/todo.org" "予定")
         "* TODO %?\n\n")
        ("m" "Memo" entry
         (file+headline "~/org/memo.org" "メモ")
         "* %U%?\n%i\n%a")))
;; org-agendaでaを押したら予定表とTODOリストを表示
(setq org-agenda-custom-commands
      '(("a" "Agenda and TODO"
         ((agenda "")
          (alltodo "")))))
;; org-agendaで扱うファイルは複数可だが、
;; TODO・予定用のファイルのみ指定
(setq org-agenda-files '("~/org/todo.org"))
;; TODOリストに日付つきTODOを表示しない
(setq org-agenda-todo-ignore-with-date t)
;; 今日から予定を表示させる
(setq org-agenda-start-on-weekday nil)

;; Latex出力設定変更
;; Org Mode LaTeX Export
(require 'ox-latex)

(unless (boundp 'org-latex-classes)
  (setq org-latex-classes nil))

; pdf process = dvipdfmx
(setq org-latex-pdf-process
      '("uplatex %f"
        "uplatex %f"
        ;; "bibtex %b"
        ;; "platex %f"
        ;; "platex %f"
        "dvipdfmx %b.dvi"))
;; default class = jsarticle
(setq org-latex-default-class "jsarticle")

;; org-latex-classes
(add-to-list 'org-latex-classes
             '("jsarticle"
               "\\documentclass[11pt,a4paper,uplatex]{jsarticle}
 \\usepackage[dvipdfmx]{hyperref}
 \\usepackage[dvipdfmx]{graphicx}
                [NO-DEFAULT-PACKAGES] [PACKAGES] [EXTRA]"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")
               ))

;; (add-to-list 'org-latex-classes
;;              '("jsarticle"
;;                "\\documentclass[11pt,a4paper,uplatex]{jsarticle}
;;                 [NO-DEFAULT-PACKAGES]
;;                 [PACKAGES]
;;                 [EXTRA]
;;                 \\usepackage[dvipdfmx]{hyperref}
;; \\usepackage[dvipdfmx]{graphicx}"
;;                ("\\section{%s}" . "\\section*{%s}")
;;                ("\\subsection{%s}" . "\\subsection*{%s}")
;;                ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
;;                ("\\paragraph{%s}" . "\\paragraph*{%s}")
;;                ("\\subparagraph{%s}" . "\\subparagraph*{%s}")
;;                )
;; 			 ("jsbook"
;;             "\\documentclass{jsbook}
;; \\usepackage[dvipdfmx]{graphicx}
;; \\usepackage{url}
;; \\usepackage{atbegshi}
;; \\AtBeginShipoutFirst{\\special{pdf:tounicode EUC-UCS2}}
;; \\usepackage[dvipdfmx,setpagesize=false]{hyperref}
;;  [NO-DEFAULT-PACKAGES]
;;  [PACKAGES]
;;  [EXTRA]"
;;             ("\\chapter{%s}" . "\\chapter*{%s}")
;;             ("\\section{%s}" . "\\section*{%s}")
;;             ("\\subsection{%s}" . "\\subsection*{%s}")
;;             ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
;;             ("\\paragraph{%s}" . "\\paragraph*{%s}")
;;             ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
;;                )))


;; org-export-latex-no-toc
(defun org-export-latex-no-toc (depth)
    (when depth
      (format "%% Org-mode is exporting headings to %s levels.\n"
              depth)))
(setq org-export-latex-format-toc-function 'org-export-latex-no-toc)

;; package list
(add-to-list 'org-latex-packages-alist '("" "pxjahyper") t)
(add-to-list 'org-latex-packages-alist "\\hypersetup{setpagesize=false}" t)
