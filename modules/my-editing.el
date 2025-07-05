;;; my-editing.el --- allhailthetail's Apollo customization.

;;; Commentary:

;;; code:

;; emacs writes backup files to .emacs.d.apollo/backups:
(setq backup-directory-alist
      `(("." . "~/.emacs.d.apollo/backups")))
(setq backup-by-copying t)    ; Don't clobber symlinks
(setq delete-old-versions t)
(setq version-control t)      ; Use version numbers for backups
(setq kept-new-versions 6)
(setq kept-old-versions 2)

;; Ensure that lsp-mode is triggered any time
;; a .py file is opened:
(use-package lsp-mode
  :hook ((python-mode . lsp))
  :commands lsp)

(provide 'my-editing)
;;; my-editing.el ends here.
