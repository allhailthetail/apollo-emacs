;;; dev.el

;; Programming: LSP, Company, Flycheck
(use-package company
  :hook (prog-mode . company-mode))

(use-package flycheck
  :hook (prog-mode . flycheck-mode))

(use-package lsp-mode
  :hook ((python-mode . lsp)
         (rust-mode . lsp)
         (c-mode . lsp)
         (c++-mode . lsp)
         (ess-r-mode . lsp))
  :commands lsp)

(use-package lsp-ui
  :commands lsp-ui-mode)

;; Language Modes
(use-package python-mode)
(use-package rust-mode)
(use-package ess)
(use-package ob-rust)
