;;; my-dev.el --- allhailthetail's Apollo customization.

;;; Commentary:

;;; code:

;; Programming: LSP, Company, Flycheck, clang, etc.
;; company: autocomplete, fuzzy matching...
(use-package company
  :ensure t
  :hook (prog-mode . company-mode))

;; flycheck: live error feedback
(use-package flycheck
  :ensure t
  :hook (prog-mode . flycheck-mode))

;; NOTE: lsp-mode requires a language server in order to work with
;;       C++. Instructions for a few popular OS:
;;       Arch: pacman -S clang  #(clang-tools included)
;;       Debian: apt install clang clang-tools
(use-package lsp-mode
  :ensure t
  :hook ((python-mode . lsp)
         (rust-mode . lsp)
         (c-mode . lsp)
         (c++-mode . lsp)
         (ess-r-mode . lsp))
  :commands lsp)

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

;; Language Modes:
(use-package python-mode
  :ensure t)
;; ess: Emacs Speaks Statistics --> R Language.
(use-package ess
  :ensure t)
;; In case things get rusty...
(use-package ob-rust
  :ensure t)
(use-package rust-mode
  :ensure t)

(provide 'my-dev)
;;; my-dev.el ends here
