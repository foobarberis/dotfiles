;;; early-init.el --- Early initialization file  -*- lexical-binding: t; -*-

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

(straight-use-package 'use-package)

(use-package emacs
  :init
  (setq inhibit-startup-screen t
        inhibit-splash-screen t
        inhibit-startup-message t
        ring-bell-function 'ignore
        display-buffer-alist
        (cons '("\\`\\*\\(Warnings\\|Compile-Log\\)\\*\\'"
                (display-buffer-no-window)
                (allow-no-window . t))
              display-buffer-alist))
  :config
  (scroll-bar-mode -1)
  (tool-bar-mode -1)
  (menu-bar-mode -1)
  (fringe-mode 0))

(provide 'early-init)
;;; early-init.el ends here
