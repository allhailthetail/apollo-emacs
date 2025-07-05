;;; my-packages.el --- allhailthetail's Apollo customization.

;;; Commentary:

;;; code:

;; Bootstrap tools to run use-package:
(require 'package)

;; Package archives
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("gnu"   . "https://elpa.gnu.org/packages/")))

(setq package-enable-at-startup nil)  ;; Prevent early loading
(package-initialize)

;; Bootstrap use-package if necessary
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(defvar apollo-custom-packages
  '(which-key
    auto-sudoedit
    company
    flycheck
    lsp-mode
    lsp-ui
    org
    org-modern
    org-super-agenda
    rust-mode
    ess
    dashboard
    ef-themes
    inhibit-mouse
    nerd-icons
    all-the-icons
    projectile
    page-break-lines)
  "List of core packages for Apollo config.")

(dolist (pkg apollo-custom-packages)
  (unless (package-installed-p pkg)
    (package-install pkg)))

(provide 'my-packages)
;;; my-packages.el ends here
