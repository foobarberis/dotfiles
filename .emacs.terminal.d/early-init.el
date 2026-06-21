;;; early-init.el --- Terminal Emacs early init  -*- lexical-binding: t; -*-

(setq package-enable-at-startup nil)
(setq inhibit-startup-screen t
      inhibit-splash-screen t
      inhibit-startup-message t
      ring-bell-function #'ignore
      warning-minimum-level :error
      native-comp-async-report-warnings-errors 'silent
      display-buffer-alist
      (cons '("\\`\\*\\(Warnings\\|Compile-Log\\)\\*\\'"
              (display-buffer-no-window)
              (allow-no-window . t))
            display-buffer-alist))

(when (fboundp 'menu-bar-mode)
  (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))
(when (fboundp 'fringe-mode)
  (fringe-mode 0))

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
(setq straight-use-package-by-default t)

(provide 'early-init)
;;; early-init.el ends here
