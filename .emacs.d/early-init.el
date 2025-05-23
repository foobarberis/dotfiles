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
  (when (display-graphic-p)
    (fringe-mode 5)))

(set-face-attribute 'default nil
                    :family "Iosevka"
                    :height 100
                    :weight 'normal
                    :width 'wide)
(set-face-attribute 'fixed-pitch nil
                    :font "Iosevka"
                    :height 100
                    :weight 'normal
                    :width 'wide)

(provide 'early-init)
;;; early-init.el ends here
