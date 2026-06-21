;;; init.el --- Minimal terminal Emacs config  -*- lexical-binding: t; -*-

(require 'subr-x)

(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file :no-error-if-missing)

(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8)

(setq use-short-answers t
      y-or-n-p-use-read-key t
      confirm-kill-emacs #'y-or-n-p
      cursor-type 'hbar
      scroll-margin 2
      scroll-preserve-screen-position t
      visible-bell nil
      ring-bell-function #'ignore
      indent-tabs-mode nil
      standard-indent 2
      tab-width 2
      fill-column 80
      truncate-lines t
      truncate-partial-width-windows nil
      sentence-end-double-space nil
      history-delete-duplicates t
      kill-do-not-save-duplicates t
      case-fold-search t
      search-upper-case 'not-yanks
      completion-cycle-threshold 3
      completions-detailed t
      read-buffer-completion-ignore-case t
      read-file-name-completion-ignore-case t
      completion-ignore-case t)

(setq-default indent-tabs-mode nil
              tab-width 2
              fill-column 80
              truncate-lines t)

(global-unset-key (kbd "C-z"))
(global-unset-key (kbd "C-x C-c"))
(global-set-key (kbd "C-c x") #'execute-extended-command)
(global-set-key (kbd "C-c f") #'project-find-file)
(global-set-key (kbd "C-c g") #'project-find-regexp)

(global-font-lock-mode -1)
(add-hook 'after-change-major-mode-hook (lambda () (font-lock-mode -1)))
(require 'hl-line)

(defun my/plain-face (face)
  (when (facep face)
    (set-face-attribute face nil
                        :inherit nil
                        :foreground 'unspecified
                        :background 'unspecified
                        :weight 'normal
                        :slant 'normal
                        :underline nil)))

(defun my/plain-ui-faces ()
  (when (facep 'cursor)
    (set-face-attribute 'cursor nil :background "black"))
  (when (facep 'hl-line)
    (set-face-attribute 'hl-line nil
                        :inherit nil
                        :foreground 'unspecified
                        :background 'unspecified
                        :underline '(:color "black" :style line)))
  (dolist (face '(minibuffer-prompt
                  completions-annotations
                  completions-common-part
                  completions-first-difference
                  match
                  lazy-highlight
                  isearch
                  consult-preview-match
                  consult-highlight-match
                  consult-highlight-mark
                  consult-highlight-symbol
                  marginalia-archive
                  marginalia-char
                  marginalia-date
                  marginalia-documentation
                  marginalia-file-name
                  marginalia-file-owner
                  marginalia-file-priv-dir
                  marginalia-file-priv-exec
                  marginalia-file-priv-link
                  marginalia-file-priv-no
                  marginalia-file-priv-other
                  marginalia-file-priv-read
                  marginalia-file-priv-write
                  marginalia-function
                  marginalia-installed
                  marginalia-key
                  marginalia-lighter
                  marginalia-list
                  marginalia-mode
                  marginalia-modified
                  marginalia-null
                  marginalia-number
                  marginalia-off
                  marginalia-on
                  marginalia-size
                  marginalia-string
                  marginalia-symbol
                  marginalia-true
                  marginalia-type
                  marginalia-value
                  marginalia-version
                  orderless-match-face-0
                  orderless-match-face-1
                  orderless-match-face-2
                  orderless-match-face-3))
    (my/plain-face face))
  (when (facep 'vertico-current)
    (set-face-attribute 'vertico-current nil
                        :inherit nil
                        :foreground 'unspecified
                        :background 'unspecified
                        :underline '(:color "black" :style line))))

(my/plain-ui-faces)
(add-hook 'after-init-hook #'my/plain-ui-faces)

(column-number-mode 1)
(global-display-line-numbers-mode 1)
(setq global-hl-line-sticky-flag nil)
(global-hl-line-mode 1)

(pixel-scroll-precision-mode 1)
(xterm-mouse-mode 1)
(mouse-wheel-mode 1)

(use-package files
  :straight nil
  :custom
  (make-backup-files nil)
  (auto-save-default nil)
  (create-lockfiles nil)
  (require-final-newline t)
  :hook
  (before-save . delete-trailing-whitespace))

(use-package autorevert
  :straight nil
  :custom
  (auto-revert-verbose nil)
  (global-auto-revert-non-file-buffers t)
  :hook
  (after-init . global-auto-revert-mode))

(use-package savehist
  :straight nil
  :custom
  (savehist-save-minibuffer-history t)
  :hook
  (after-init . savehist-mode))

(use-package recentf
  :straight nil
  :custom
  (recentf-max-saved-items 200)
  (recentf-auto-cleanup 'never)
  :hook
  (after-init . recentf-mode))

(use-package delsel
  :straight nil
  :hook
  (after-init . delete-selection-mode))

(use-package dired
  :straight nil
  :commands dired
  :custom
  (dired-recursive-copies 'always)
  (dired-recursive-deletes 'always)
  (dired-dwim-target t)
  :hook
  (dired-mode . dired-hide-details-mode))

(use-package project
  :straight nil
  :bind
  (("C-c f" . project-find-file)
   ("C-c g" . project-find-regexp)))

(use-package which-key
  :straight nil
  :hook
  (after-init . which-key-mode))

(use-package minions
  :demand t
  :config
  (minions-mode 1))

(use-package helpful
  :demand t
  :bind
  (("C-h f" . helpful-callable)
   ("C-h v" . helpful-variable)
   ("C-h k" . helpful-key)
   ("C-h x" . helpful-command)
   ("C-h F" . helpful-function)))

(use-package vertico
  :demand t
  :config
  (vertico-mode 1))

(use-package marginalia
  :demand t
  :config
  (marginalia-mode 1))

(use-package orderless
  :demand t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package consult
  :demand t
  :bind
  (("C-s" . consult-line)
   ("C-x b" . consult-buffer)
   ("M-y" . consult-yank-pop)
   ("M-g g" . consult-goto-line)
   ("M-g M-g" . consult-goto-line)
   ("M-s g" . consult-grep)
   ("M-s r" . consult-ripgrep)
   ("M-s l" . consult-line)
   ("C-c b" . consult-buffer)
   ("C-c s" . consult-line)
   ("C-c r" . consult-ripgrep))
  :custom
  (xref-show-xrefs-function #'consult-xref)
  (xref-show-definitions-function #'consult-xref))

(use-package meow
  :demand t
  :config
  (defun my/meow-setup ()
    (setq meow-cheatsheet-layout meow-cheatsheet-layout-qwerty)
    (meow-motion-overwrite-define-key
     '("j" . meow-next)
     '("k" . meow-prev)
     '("<escape>" . ignore))
    (meow-leader-define-key
     '("?" . meow-cheatsheet)
     '("SPC" . execute-extended-command)
     '("f" . project-find-file)
     '("g" . project-find-regexp)
     '("b" . consult-buffer)
     '("s" . consult-line)
     '("r" . consult-ripgrep)
     '("h" . help-command))
    (meow-normal-define-key
     '("0" . meow-expand-0)
     '("9" . meow-expand-9)
     '("8" . meow-expand-8)
     '("7" . meow-expand-7)
     '("6" . meow-expand-6)
     '("5" . meow-expand-5)
     '("4" . meow-expand-4)
     '("3" . meow-expand-3)
     '("2" . meow-expand-2)
     '("1" . meow-expand-1)
     '("-" . negative-argument)
     '(";" . meow-reverse)
     '("," . meow-inner-of-thing)
     '("." . meow-bounds-of-thing)
     '("[" . meow-beginning-of-thing)
     '("]" . meow-end-of-thing)
     '("a" . meow-append)
     '("A" . meow-open-below)
     '("b" . meow-back-word)
     '("B" . meow-back-symbol)
     '("c" . meow-change)
     '("d" . meow-delete)
     '("D" . meow-backward-delete)
     '("e" . meow-next-word)
     '("E" . meow-next-symbol)
     '("f" . meow-find)
     '("g" . meow-cancel-selection)
     '("G" . meow-grab)
     '("h" . meow-left)
     '("H" . meow-left-expand)
     '("i" . meow-insert)
     '("I" . meow-open-above)
     '("j" . meow-next)
     '("J" . meow-next-expand)
     '("k" . meow-prev)
     '("K" . meow-prev-expand)
     '("l" . meow-right)
     '("L" . meow-right-expand)
     '("m" . meow-join)
     '("n" . meow-search)
     '("o" . meow-block)
     '("O" . meow-to-block)
     '("p" . meow-yank)
     '("q" . meow-quit)
     '("Q" . meow-goto-line)
     '("r" . meow-replace)
     '("R" . meow-swap-grab)
     '("s" . meow-kill)
     '("t" . meow-till)
     '("u" . meow-undo)
     '("U" . meow-undo-in-selection)
     '("v" . meow-visit)
     '("w" . meow-mark-word)
     '("W" . meow-mark-symbol)
     '("x" . meow-line)
     '("X" . meow-goto-line)
     '("y" . meow-save)
     '("Y" . meow-sync-grab)
     '("z" . meow-pop-selection)
     '("'" . repeat)
     '("<escape>" . ignore)))
  (my/meow-setup)
  (meow-global-mode 1))

(defun my/pbcopy (text)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" nil "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))

(defun my/pbpaste ()
  (when (executable-find "pbpaste")
    (string-trim-right (shell-command-to-string "pbpaste") "[\n\r]+")))

(defun my/osc52-copy (text)
  (let* ((data (base64-encode-string text t))
         (seq (concat "\e]52;c;" data "\a")))
    (send-string-to-terminal
     (if (getenv "TMUX")
         (concat "\ePtmux;\e" seq "\e\\")
       seq))))

(defun my/copy-to-clipboard (text &optional _push)
  (when (executable-find "pbcopy")
    (my/pbcopy text))
  (my/osc52-copy text))

(setq select-enable-clipboard t
      interprogram-cut-function #'my/copy-to-clipboard
      interprogram-paste-function #'my/pbpaste)

(defun my/keyboard-quit-dwim ()
  (interactive)
  (cond
   ((region-active-p) (keyboard-quit))
   ((derived-mode-p 'completion-list-mode) (delete-completion-window))
   ((> (minibuffer-depth) 0) (abort-recursive-edit))
   (t (keyboard-quit))))

(global-set-key (kbd "C-g") #'my/keyboard-quit-dwim)

(provide 'init)
;;; init.el ends here
