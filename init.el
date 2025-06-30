;;; init.el --- Init file for allhailthetail's Apollo config
;;; Commentary:
;;; Editing of this file shouldn't be necessary, unless you yourself
;;; have some need to add additional .el files to load.


;;; add modules dir to path:
(add-to-list 'load-path (expand-file-name "modules" user-emacs-directory))
;;; Specify modules in ./modules/ dir to run:
;;(require 'all) ;; Temporary...

(require 'packages)   ;; use-package + package list
(require 'ui)         ;; appearance
(require 'editing)    ;; editing behavior
(require 'org)        ;; org-mode configs
(require 'dev)        ;; language support (lsp, python, rust, etc.)

;; Custom file:
;; This supposedly prevents emacs from polluting emacs with your custom stuff.
;; For some good reasons, modules/custom.el should remain in .gitignore
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))
