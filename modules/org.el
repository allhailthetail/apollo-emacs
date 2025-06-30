;;; org.el

;; Org-Mode Enhancements
(use-package org
  :hook ((org-mode . org-indent-mode)
         (org-mode . visual-line-mode))
  :config
  (setq org-startup-indented t
        org-hide-emphasis-markers t
        org-ellipsis "…"
        org-pretty-entities t
        org-agenda-files '("~/org/inbox.org"
                           "~/org/projects.org"
                           "~/org/someday.org"
                           "~/org/notes.org")
        org-todo-keywords
        '((sequence "TODO(t)" "NEXT(n)" "WAIT(w@/!)" "|" "DONE(d!)" "CANCELLED(c@)"))
        org-todo-keyword-faces
        '(("TODO" . warning)
          ("NEXT" . (:foreground "orange" :weight bold))
          ("WAIT" . (:foreground "magenta" :weight bold))
          ("DONE" . (:foreground "green" :weight bold))
          ("CANCELLED" . (:foreground "gray" :weight bold)))))

;; Skip safety prompt for executing certain files
;; Maybe there'd be a nicer way to do this and safer,
;; but for right now, this is how I know to do it.
(defun my-org-confirm-babel-evaluate (lang body)
  "Don't prompt for certain languages in org-babel."
  (not (member lang '("python" "C" "cpp" "rust"))))
(setq org-confirm-babel-evaluate #'my-org-confirm-babel-evaluate)

;; Make ORG look a little nicer...
(use-package org-superstar
  :hook (org-mode . org-superstar-mode)
  :config
  (setq org-superstar-headline-bullets-list '("●" "○" "✸" "✿")))

(use-package org-super-agenda
  :after org-agenda
  :config
  (org-super-agenda-mode)
  (setq org-agenda-custom-commands
        '(("o" "Overview"
           ((agenda "")
            (alltodo ""
             ((org-super-agenda-groups
               '((:name "Today"
                        :time-grid t
                        :scheduled today)
                 (:name "Important"
                        :priority "A")
                 (:name "Due soon"
                        :deadline future)
                 (:name "Overdue"
                        :deadline past)
                 (:name "Big Projects"
                        :tag "project"))))))))))

;; Org Smarter Ctrl-Return hints:
(defun custom-org-return ()
  "Smart Ret: inset item, heading, or newline based on context."
  (interactive)
  (cond
   ;; At checkbox item, insert new checkbox
   ((org-at-item-checkbox-p)
    (org-insert-todo-heading nil))
   ;; At plain list item
   ((org-at-item-p)
    (org-insert-item))
   ;; At heading
   ((org-at-heading-p)
    (org-insert-heading-after-current))
   ;; In table
   ((org-at-table-p)
    (org-table-insert-row))
   ;; On a link
   ((org-in-regexp org-link-bracket-re 1)
    (org-open-at-point))
   ;; Default behavior
   (t (newline-and-indent))))
(with-eval-after-load 'org
  (define-key org-mode-map (kbd "RET") #'custom-org-return)
  (define-key org-mode-map (kbd "C-<return>") #'org-insert-heading-respect-content)) ;;Optional fallback

;; Org Capture Templates
(setq org-capture-templates
      '(("t" "Todo [inbox]" entry (file "~/org/inbox.org")
         "* TODO %i%?\n  %U\n  %a")
        ("n" "Note [inbox]" entry (file+headline "~/org/notes.org" "Inbox")
         "* %u %?\n  %i\n  %a")))

;; Org Babel Languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (python . t)
   (C . t)
   (shell . t)
   (R . t)))
