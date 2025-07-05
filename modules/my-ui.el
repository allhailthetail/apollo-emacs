;;; my-ui.el --- Apollo Emacs customizations for UI experience

;;; Commentary:

;;; Code:

;; Disable Cursor Blink
(blink-cursor-mode -1)

;; Disable menu bar and top bar:
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Inhibit Mouse
(use-package inhibit-mouse
  :custom
  (inhibit-mouse-adjust-mouse-highlight t)
  (inhibit-mouse-adjust-show-help-function t)
  :config
  (if (daemonp)
      (add-hook 'server-after-make-frame-hook #'inhibit-mouse-mode)
    (inhibit-mouse-mode 1)))

;; Theme
(use-package ef-themes)
(load-theme 'ef-maris-light :no-confirm)

;; Dashboard
(use-package dashboard
  :config
  (setq dashboard-startup-banner 'official
        dashboard-items '((recents . 5)
                          (projects . 3)))
  (dashboard-setup-startup-hook))

;; Appearance Tweaks
(setq line-spacing 0.14)
(setq-default fill-column 80)

;; Which-key for keybinding discovery
(use-package which-key
  :init (which-key-mode)
  :config (setq which-key-idle-delay 0.5))

(provide 'my-ui)
;;; my-ui.el ends here.
