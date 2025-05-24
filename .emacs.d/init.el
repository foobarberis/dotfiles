;;; init.el --- Emacs configuration file  -*- lexical-binding: t; -*-

(use-package exec-path-from-shell
  :straight t
  :custom
  (exec-path-from-shell-arguments '(nil) "Set to use a non-interactive shell for faster startup.")
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

;;; Built-ins ;;;

(setq warning-minimum-level :error)

(require-theme 'modus-themes)
(setq modus-themes-italic-constructs t
      modus-themes-bold-constructs nil)
(load-theme 'modus-operandi)
(define-key global-map (kbd "<f5>") #'modus-themes-toggle)

(use-package fontaine
  :straight t
  :config
  (setq fontaine-presets
	'((regular
	   :default-family "Iosevka"
	   :default-weight regular
	   :default-slant normal
	   :default-width wide
	   :default-height 120

	   :fixed-pitch-family "Iosevka"
	   :fixed-pitch-weight regular
	   :fixed-pitch-slant normal
	   :fixed-pitch-width wide
	   :fixed-pitch-height 120
	   :line-spacing 1)
	  (bigger
	   :default-family "Iosevka"
	   :default-weight regular
	   :default-slant normal
	   :default-width wide
	   :default-height 140

	   :fixed-pitch-family "Iosevka"
	   :fixed-pitch-weight regular
	   :fixed-pitch-slant normal
	   :fixed-pitch-width wide
	   :fixed-pitch-height 140
	   :line-spacing 1)))
  (fontaine-mode 1)
  (fontaine-set-preset 'regular))

(use-package time
  :commands world-clock
  :init
  (add-to-list 'tab-bar-format 'tab-bar-format-align-right 'append)
  (add-to-list 'tab-bar-format 'tab-bar-format-global 'append)
  :config
  (setq display-time-format "%d-%m-%Y %H:%M")
  (setq display-time-interval 60)
  (setq display-time-mail-directory nil)
  (setq display-time-default-load-average nil)
  :hook (after-init . display-time-mode))

(use-package battery
  :hook (after-init . display-battery-mode))

;; Display time and battery level in the tab bar
(setopt global-mode-string '("" display-time-string battery-mode-line-string))

(use-package tab-bar
  :straight nil
  :config
  (tab-bar-mode 1)
  (setq tab-bar-separator "")
  (setq tab-bar-tab-hints nil)
  :custom
  (tab-bar-format
   '(tab-bar-format-tabs
     tab-bar-separator
     tab-bar-format-align-right
     tab-bar-format-global))
  :bind
  (("C-c t n" . tab-new)
   ("C-c t k" . tab-close)
   ("C-c t f" . tab-next)
   ("C-c t p" . tab-previous)))

(which-key-mode 1)

(delete-selection-mode 1)

(put 'narrow-to-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)

(setq mac-right-option-modifier nil)
(global-unset-key "\C-z")
(global-unset-key "\C-x\ \C-c")

(use-package files
  :straight nil
  :custom
  ((make-backup-files nil "Do not make backup files on save buffer.")
   (auto-save-default nil "Do not auto-save of every file-visiting buffer.")
   (create-lockfiles  nil "Do not use lock-files.")
   (require-final-newline t "Ends file with a newline.")
   (delete-by-moving-to-trash t "Use the system's trash can"))
  :hook
  (before-save . #'delete-trailing-whitespace))

(use-package dired
  :straight nil
  :custom
  (dired-dwim-target t "Make Dired try to guess a default target directory."))

(use-package org
  :straight nil
  :config
  (setq org-M-RET-may-split-line '((default . nil)))
  (setq org-insert-heading-respect-content t)
  (setq org-confirm-babel-evaluate nil)
  (setq org-log-done 'time)
  (setq org-log-into-drawer t)
  (setq org-tags-column -80)
  (setq org-startup-with-inline-images t)
  :hook
  (dired-mode . dired-hide-details-mode))

(use-package treesit
  :config
  (setq treesit-language-source-alist
	'((bash "https://github.com/tree-sitter/tree-sitter-bash")
	  (css "https://github.com/tree-sitter/tree-sitter-css")
	  (elisp "https://github.com/Wilfred/tree-sitter-elisp")
	  (html "https://github.com/tree-sitter/tree-sitter-html")
	  (javascript "https://github.com/tree-sitter/tree-sitter-javascript")
	  (cpp "https://github.com/tree-sitter/tree-sitter-cpp")
	  (c "https://github.com/tree-sitter/tree-sitter-c")
	  (make "https://github.com/alemuller/tree-sitter-make")
	  (json "https://github.com/tree-sitter/tree-sitter-json")
	  (toml "https://github.com/tree-sitter/tree-sitter-toml")
	  (yaml "https://github.com/ikatyang/tree-sitter-yaml"))))

;;; Packages ;;;

(use-package helpful
  :straight t
  :bind
  (("C-h f" . helpful-callable)
   ("C-h v" . helpful-variable)
   ("C-h k" . helpful-key)
   ("C-h x" . helpful-command)
   ("C-c C-d" . helpful-at-point)
   ("C-h F" . helpful-function)))

(use-package vertico
  :straight t
  :config
  (vertico-mode 1))

(use-package marginalia
  :straight t
  :config
  (marginalia-mode 1))

(use-package orderless
  :straight t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion))))
  (completion-category-overrides '((eglot (styles . (orderless flex))))))

(use-package consult
  :straight t
  :bind (
	 ("C-s" . consult-line)
	 ("s-f" . consult-line)
         ("C-c M-x" . consult-mode-command)
         ("C-c h" . consult-history)
         ("C-c k" . consult-kmacro)
         ("C-c m" . consult-man)
         ("C-c i" . consult-info)
         ([remap Info-search] . consult-info)
         ;; C-x bindings in `ctl-x-map'
         ("C-x M-:" . consult-complex-command)     ;; orig. repeat-complex-command
         ("C-x b" . consult-buffer)                ;; orig. switch-to-buffer
         ("C-x 4 b" . consult-buffer-other-window) ;; orig. switch-to-buffer-other-window
         ("C-x 5 b" . consult-buffer-other-frame)  ;; orig. switch-to-buffer-other-frame
         ("C-x t b" . consult-buffer-other-tab)    ;; orig. switch-to-buffer-other-tab
         ("C-x r b" . consult-bookmark)            ;; orig. bookmark-jump
         ("C-x p b" . consult-project-buffer)      ;; orig. project-switch-to-buffer
         ;; Custom M-# bindings for fast register access
         ("M-#" . consult-register-load)
         ("M-'" . consult-register-store)          ;; orig. abbrev-prefix-mark (unrelated)
         ("C-M-#" . consult-register)
         ;; Other custom bindings
         ("M-y" . consult-yank-pop)                ;; orig. yank-pop
         ;; M-g bindings in `goto-map'
         ("M-g e" . consult-compile-error)
         ("M-g f" . consult-flymake)               ;; Alternative: consult-flycheck
         ("M-g g" . consult-goto-line)             ;; orig. goto-line
         ("M-g M-g" . consult-goto-line)           ;; orig. goto-line
         ("M-g o" . consult-outline)               ;; Alternative: consult-org-heading
         ("M-g m" . consult-mark)
         ("M-g k" . consult-global-mark)
         ("M-g i" . consult-imenu)
         ("M-g I" . consult-imenu-multi)
         ;; M-s bindings in `search-map'
         ("M-s d" . consult-find)                  ;; Alternative: consult-fd
         ("M-s c" . consult-locate)
         ("M-s g" . consult-grep)
         ("M-s G" . consult-git-grep)
         ("M-s r" . consult-ripgrep)
         ("M-s l" . consult-line)
         ("M-s L" . consult-line-multi)
         ("M-s k" . consult-keep-lines)
         ("M-s u" . consult-focus-lines)
         ;; Isearch integration
         ("M-s e" . consult-isearch-history)
         :map isearch-mode-map
         ("M-e" . consult-isearch-history)         ;; orig. isearch-edit-string
         ("M-s e" . consult-isearch-history)       ;; orig. isearch-edit-string
         ("M-s l" . consult-line)                  ;; needed by consult-line to detect isearch
         ("M-s L" . consult-line-multi)            ;; needed by consult-line to detect isearch
         ;; Minibuffer history
         :map minibuffer-local-map
         ("M-s" . consult-history)                 ;; orig. next-matching-history-element
         ("M-r" . consult-history))                ;; orig. previous-matching-history-element

  ;; Enable automatic preview at point in the *Completions* buffer. This is
  ;; relevant when you use the default completion UI.
  :hook (completion-list-mode . consult-preview-at-point-mode)

  ;; The :init configuration is always executed (Not lazy)
  :init

  ;; Tweak the register preview for `consult-register-load',
  ;; `consult-register-store' and the built-in commands.  This improves the
  ;; register formatting, adds thin separator lines, register sorting and hides
  ;; the window mode line.
  (advice-add #'register-preview :override #'consult-register-window)
  (setq register-preview-delay 0.5)

  ;; Use Consult to select xref locations with preview
  (setq xref-show-xrefs-function #'consult-xref
        xref-show-definitions-function #'consult-xref)

  ;; Configure other variables and modes in the :config section,
  ;; after lazily loading the package.
  :config

  ;; Optionally configure preview. The default value
  ;; is 'any, such that any key triggers the preview.
  ;; (setq consult-preview-key 'any)
  ;; (setq consult-preview-key "M-.")
  ;; (setq consult-preview-key '("S-<down>" "S-<up>"))
  ;; For some commands and buffer sources it is useful to configure the
  ;; :preview-key on a per-command basis using the `consult-customize' macro.
  (consult-customize
   consult-theme :preview-key '(:debounce 0.2 any)
   consult-ripgrep consult-git-grep consult-grep consult-man
   consult-bookmark consult-recent-file consult-xref
   consult--source-bookmark consult--source-file-register
   consult--source-recent-file consult--source-project-recent-file
   ;; :preview-key "M-."
   :preview-key '(:debounce 0.4 any))

  ;; Optionally configure the narrowing key.
  ;; Both < and C-+ work reasonably well.
  (setq consult-narrow-key "<") ;; "C-+"

  ;; Optionally make narrowing help available in the minibuffer.
  ;; You may want to use `embark-prefix-help-command' or which-key instead.
  ;; (keymap-set consult-narrow-map (concat consult-narrow-key " ?") #'consult-narrow-help)
  )

(use-package magit
  :straight t)

(use-package vterm
  :straight t
  :hook (vterm-mode . (lambda () (setq-local global-hl-line-mode nil)))
  :custom (initial-buffer-choice 'vterm))

(use-package denote
  :straight t
  :config
  (setq my-note-directory "~/Files/Documents/Notes/")
  (setq denote-directory (expand-file-name my-note-directory))
  (setq denote-dired-directories (list (expand-file-name my-note-directory)))
  :hook (dired-mode . denote-dired-mode))

(use-package jinx
  :straight t
  :diminish t
  :hook
  ((LaTeX-mode . jinx-mode)
   (latex-mode . jinx-mode)
   (markdown-mode . jinx-mode)
   (org-mode . jinx-mode))
  :custom
  ((jinx-languages "fr_FR en_US" "Dictionary language codes, as a string separated by whitespace."))
  :bind
  (("M-$" . jinx-correct)
   ("C-M-$" . jinx-languages)))

(use-package diminish
  :straight t
  :config
  (diminish 'visual-line-mode)
  (diminish 'which-key-mode)
  (diminish 'auto-revert-mode)
  (diminish 'eldoc-mode))

;;; Utilities ;;;

(defun my-html-sort-classes ()
  "Sort CSS classes in alphabetical order in an HTML document."
  (interactive)
  (save-excursion
    (while (search-forward "class=\"" nil t)
      (setq begin (point))
      (setq end (- (search-forward "\"" nil t) 1))
      (sort-regexp-fields nil "\\(\\sw\\|\\s_\\)+" "\\&" begin end))))

(with-eval-after-load 'mhtml-mode
  (keymap-set mhtml-mode-map "C-c f" 'my-html-sort-classes))

(defun my-dired-image-to-pdf ()
  "In a Dired buffer, this function creates a PDF file from the marked
image files using ImageMagick."
  (interactive)
  (setq filename (read-string "Enter filename: "))
  (shell-command (format "magick %s -quality 75 %s.pdf" (mapconcat 'identity (dired-get-marked-files) " ") filename))
  (revert-buffer))



(defun my/org-link-copy (&optional arg)
  "Extract URL from org-mode link and add it to the kill ring."
  (interactive "P")
  (let* ((link (org-element-lineage (org-element-context) '(link) t))
         (type (org-element-property :type link))
         (url (org-element-property :path link))
         (url (concat type ":" url)))
    (kill-new url)
    (message (concat "Copied URL: " url))))

(with-eval-after-load 'org
  (define-key org-mode-map (kbd "C-x C-l") #'my/org-link-copy))

(provide 'init)
;;; init.el ends here

;; (defun my-org-sort-all ()
;;   "Sort all headings in the buffer by tags, then by TODO order, align all
;; the tags and collapse all subtrees."
;;   (interactive)
;;   (save-excursion
;;     (goto-char (point-min))
;;     (org-sort-entries t ?r nil nil "TAGS")
;;     (goto-char (point-min))
;;     (org-sort-entries t ?o)
;;     (org-align-tags t)
;;     (org-overview)))

;; (add-hook 'before-save-hook
;;           (lambda ()
;;             (when (and (eq major-mode 'org-mode)
;;                        (member (file-name-nondirectory (buffer-file-name))
;;                                '("20250218T124152--agenda__meta.org"
;;                                  "20250206T163402--liste-de-course__self.org"
;; 				   "20250213T160103--liste-voyage__self.org")))
;;               (my-org-sort-all))))


