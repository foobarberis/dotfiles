;;; early-init.el --- Early initialization file

;; -*- lexical-binding: t; -*-

;; Boostrap straight.el
(setq package-enable-at-startup nil)

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Install use-package
(straight-use-package 'use-package)

;; Configure straight to hide the *straight-process* buffer
(use-package straight
  :ensure nil
  :custom (straight-process-buffer " *straight-process*")
  :config
  (when (get-buffer "*straight-process*")
    (kill-buffer "*straight-process*")))

(use-package exec-path-from-shell
  :straight t
  :custom ((exec-path-from-shell-arguments '(nil) "Remove -i flag to use a faster, non-interactive shell."))
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

;; UI
(use-package emacs
  :init
  (setq inhibit-startup-screen t
        inhibit-splash-screen t
        inhibit-startup-message t
        ring-bell-function 'ignore
        initial-frame-alist '((fullscreen . maximized))
        display-buffer-alist
        (cons '("\\`\\*\\(Warnings\\|Compile-Log\\)\\*\\'"
                (display-buffer-no-window)
                (allow-no-window . t))
              display-buffer-alist))
  :config
  (scroll-bar-mode -1)
  (tool-bar-mode -1)
  (menu-bar-mode -1)
  (global-visual-line-mode 1)
  (global-hl-line-mode 1)
  (fringe-mode 0))

(provide 'early-init)
;;; early-init.el ends here
