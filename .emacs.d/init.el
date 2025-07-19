;;; init.el --- Emacs configuration file  -*- lexical-binding: t; -*-

(use-package exec-path-from-shell
  :straight t
  :custom
  (exec-path-from-shell-arguments '("-l") "Set to use a non-interactive shell for faster startup.")
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

;;; Built-ins ;;;

(use-package emacs
  :custom
  (cursor-type 'bar "Display cursor as a bar instead of a block")
  (tab-bar-close-button-show nil "Hide the tab close button")
  (y-or-n-p-use-read-key t "Allow answering y-or-n-p when minibuffer is not focused")
  (use-short-answers t "Enable short answers (y/n instead of yes/no)")
  (warning-minimum-level :error "Only show error-level warnings")
  (modus-themes-italic-constructs t "Use italic font forms in more code constructs")
  (modus-themes-bold-constructs t "Use bold text in more code constructs.")
  (mac-right-option-modifier nil  "Disable right Option key to not interfere with QWERTY French layout")
  (custom-file (locate-user-emacs-file "custom.el") "Set custom file path")
  (indent-tabs-mode nil "Disable tabs for indentation")
  (standard-indent 2 "Use two spaces for indentation")
  (history-delete-duplicates t "Delete duplicates in history")
  (kill-do-not-save-duplicates t "Don't add a string to kill-ring if it duplicates the last one.")
  (native-comp-async-report-warnings-errors 'silent "Silence navite-comp-async output")
  (scroll-preserve-screen-position t "Preserve cursor position when srolling")
  :hook
  (prog-mode . hl-line-mode)
  (text-mode . hl-line-mode)
  (after-init . global-visual-line-mode)
  :bind
  ("<f5>" . modus-themes-toggle)
  :config
  ;; Load custom file, don't error if missing
  (load custom-file :no-error-if-missing)

  ;; Load theme
  (require-theme 'modus-themes)
  (load-theme 'modus-operandi)

  ;; Enable disabled commands
  (put 'narrow-to-region 'disabled nil)
  (put 'downcase-region 'disabled nil)
  (put 'upcase-region 'disabled nil)
  (put 'dired-find-alternate-file 'disabled nil)

  ;; Unset potentially disruptive keybindings
  (global-unset-key "\C-z")            ; suspend-frame
  (global-unset-key "\C-x\ \C-c"))     ; save-buffers-kill-terminal

(use-package fontaine
  :straight t
  :config
  (setq fontaine-presets
	'((tiny
	   :default-family "Iosevka"
	   :default-weight regular
	   :default-slant normal
	   :default-width wide
	   :default-height 80

	   :fixed-pitch-family "Iosevka"
	   :fixed-pitch-weight regular
	   :fixed-pitch-slant normal
	   :fixed-pitch-width wide
	   :fixed-pitch-height 80
	   :line-spacing 2)

          (small
	   :default-family "Iosevka"
	   :default-weight regular
	   :default-slant normal
	   :default-width wide
	   :default-height 100

	   :fixed-pitch-family "Iosevka"
	   :fixed-pitch-weight regular
	   :fixed-pitch-slant normal
	   :fixed-pitch-width wide
	   :fixed-pitch-height 100
	   :line-spacing 2)

          (regular
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
	   :line-spacing 2)

	  (big
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
	   :line-spacing 2)))

  (fontaine-mode 1)
  (fontaine-set-preset 'regular))

(use-package simple
  :straight nil
  :config
  (column-number-mode 1))

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
  (setq tab-bar-separator " ")
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

(use-package which-key
  :straight nil
  :hook
  (after-init . which-key-mode))

(use-package delsel
  :straight nil
  :hook
  (after-init . delete-selection-mode))

(use-package savehist
  :straight nil
  :hook
  (after-init . savehist-mode))

(use-package files
  :straight nil
  :custom
  ((make-backup-files nil "Do not make backup files on save buffer.")
   (auto-save-default nil "Do not auto-save of every file-visiting buffer.")
   (create-lockfiles  nil "Do not use lock-files.")
   (require-final-newline t "Ends file with a newline.")
   (delete-by-moving-to-trash t "Use the system's trash can"))
  :hook
  (before-save . delete-trailing-whitespace))

(use-package dired
  :straight nil
  :commands (dired)
  :hook
  ((dired-mode . dired-hide-details-mode)
   (dired-mode . hl-line-mode))
  :config
  (setq dired-recursive-copies 'always)
  (setq dired-recursive-deletes 'always)
  (setq delete-by-moving-to-trash t)
  (setq dired-dwim-target t)

  (defun my/dired-image-to-pdf ()
    "In a Dired buffer, this function creates a PDF file from the marked
image files using ImageMagick."
    (interactive)
    (setq filename (read-string "Enter filename: "))
    (shell-command (format "magick %s -quality 75 %s.pdf" (mapconcat 'identity (dired-get-marked-files) " ") filename))
    (revert-buffer)))

(use-package org
  :straight nil
  :config
  (setq org-M-RET-may-split-line '((default . nil)))
  (setq org-insert-heading-respect-content t)
  (setq org-use-fast-todo-selection 'nil)
  (setq org-confirm-babel-evaluate nil)
  (setq org-log-done 'time)
  (setq org-log-into-drawer t)
  (setq org-tags-column -80)
  (setq org-startup-with-inline-images t)
  (setq org-auto-align-tags nil)
  (setq org-tags-column 0)
  (setq org-catch-invisible-edits 'show-and-error)
  (setq org-special-ctrl-a/e t)
  (setq org-insert-heading-respect-content t)
  (setq org-hide-emphasis-markers t)
  (setq org-pretty-entities t)
  (setq org-agenda-tags-column 0)
  (setq org-ellipsis "…")

  (setq org-todo-keyword-faces
      '(("INPROGRESS" . (:foreground "orange" :weight bold))))

  (defun my/org-sort-all ()
    "Sort all headings in the buffer by tags, then by TODO order, align all
the tags and collapse all subtrees."
    (interactive)
    (save-excursion
      (goto-char (point-min))
      (org-sort-entries t ?r nil nil "TAGS")
      (goto-char (point-min))
      (org-sort-entries t ?o)
      (org-align-tags t)
      (org-overview)))

  (defun my/org-link-copy (&optional arg)
    "Extract URL from org-mode link and add it to the kill ring."
    (interactive "P")
    (let* ((link (org-element-lineage (org-element-context) '(link) t))
           (type (org-element-property :type link))
           (url (org-element-property :path link))
           (url (concat type ":" url)))
      (kill-new url)
      (message (concat "Copied URL: " url))))
  :hook
  ((org-mode . org-indent-mode))
  :bind
  ((:map org-mode-map ("C-x C-l" . my/org-link-copy))))

;; Evaluate the expression below to install all specified language parsers
;; (mapc #'treesit-install-language-grammar (mapcar #'car treesit-language-source-alist))
(use-package treesit
  :straight nil
  :config

  ;; Grammar source definitions
  (setq treesit-language-source-alist
        '((bash        "https://github.com/tree-sitter/tree-sitter-bash")
          (css         "https://github.com/tree-sitter/tree-sitter-css")
          (html        "https://github.com/tree-sitter/tree-sitter-html")
          (javascript  "https://github.com/tree-sitter/tree-sitter-javascript")
          (json        "https://github.com/tree-sitter/tree-sitter-json")
          (toml        "https://github.com/tree-sitter/tree-sitter-toml")
          (yaml        "https://github.com/ikatyang/tree-sitter-yaml")
          (dockerfile  "https://github.com/camdencheek/tree-sitter-dockerfile")))

  ;; Define all language configurations in one place
  (defconst my-treesit-languages
    '(
      (sh-mode         . (bash-ts-mode         . "\\.sh\\'"))
      (css-mode        . (css-ts-mode          . "\\.css\\'"))
      (html-mode       . (html-ts-mode         . "\\.html?\\'"))
      (mhtml-mode      . (html-ts-mode         . nil))
      (js-mode         . (js-ts-mode           . "\\.js\\'"))
      (json-mode       . (json-ts-mode         . "\\.json\\'"))
      (toml-mode       . (toml-ts-mode         . "\\.toml\\'"))
      (yaml-mode       . (yaml-ts-mode         . "\\.ya?ml\\'"))
      (dockerfile-mode . (dockerfile-ts-mode   . "Dockerfile\\'"))))

  ;; Programmatically configure the remaps and auto-modes
  (dolist (lang-config my-treesit-languages)
    (let ((old-mode (car lang-config))
          (ts-mode (car (cdr lang-config)))
          (file-regex (cdr (cdr lang-config))))
      ;; Add to the major-mode-remap-alist
      (add-to-list 'major-mode-remap-alist (cons old-mode ts-mode))
      ;; Add to the auto-mode-alist if a file regex is provided
      (when file-regex
        (add-to-list 'auto-mode-alist (cons file-regex ts-mode))))))

;;; Packages ;;;

(use-package adoc-mode
  :straight t
  :mode "\\.adoc\\'")

(use-package spacious-padding
  :straight t
  :config
  (setq spacious-padding-widths
        '( :internal-border-width 0
           :right-divider-width 1
           :fringe-width 5
           :tab-width 3
           :mode-line-width 5))

  (spacious-padding-mode 1))

;; Use nerd-icons-install-fonts to dowload the icons
(use-package nerd-icons
  :straight t)

(use-package nerd-icons-completion
  :straight t
  :after marginalia
  :config
  (add-hook 'marginalia-mode-hook #'nerd-icons-completion-marginalia-setup))

(use-package nerd-icons-corfu
  :straight t
  :after corfu
  :config
  (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter))

(use-package nerd-icons-dired
  :straight t
  :hook
  (dired-mode . nerd-icons-dired-mode))

(use-package dired-subtree
  :straight t
  :after dired
  :bind
  ( :map dired-mode-map
    ("<tab>" . dired-subtree-toggle)
    ("TAB" . dired-subtree-toggle)
    ("<backtab>" . dired-subtree-remove)
    ("S-TAB" . dired-subtree-remove))
  :config
  (setq dired-subtree-use-backgrounds nil))

(use-package minions
  :straight t
  :config
  (minions-mode 1))

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

(use-package corfu
  :straight t
  :hook
  (after-init . global-corfu-mode)
  :bind
  (:map corfu-map ("<tab>" . corfu-complete))
  :config
  (setq tab-always-indent 'complete)
  (setq corfu-preview-current nil)
  (setq corfu-min-width 20)

  (setq corfu-popupinfo-delay '(1.25 . 0.5))
  (corfu-popupinfo-mode 1) ; shows documentation after `corfu-popupinfo-delay'

  ;; Sort by input history (no need to modify `corfu-sort-function').
  (with-eval-after-load 'savehist
    (corfu-history-mode 1)
    (add-to-list 'savehist-additional-variables 'corfu-history)))

(use-package magit
  :straight t)

(use-package denote
  :straight t
  :config
  (setq my-note-directory "~/Files/Documents/Notes/")
  (setq denote-directory (expand-file-name my-note-directory))
  (setq denote-dired-directories (list (expand-file-name my-note-directory)))
  :hook (dired-mode . denote-dired-mode))

(use-package jinx
  :straight t
  :custom
  ((jinx-languages "fr_FR en_US" "Dictionary language codes, as a string separated by whitespace."))
  :bind
  (("M-$" . jinx-correct)
   ("C-M-$" . jinx-languages)))

(use-package vterm
  :straight t
  :custom
  (initial-buffer-choice 'vterm)
  :hook
  ((vterm-mode . (lambda () (line-number-mode -1)))
   (vterm-mode . (lambda () (column-number-mode -1))))
  :config
  (defun my/vterm-with-prefix ()
    "Simulate `C-u M-x vterm` to open a new vterm buffer."
    (interactive)
    (let ((current-prefix-arg '(4))) ;; Equivalent to C-u
      (call-interactively 'vterm)))
  :bind
  (("C-c v" . vterm-with-prefix)))

;;; Utilities ;;;

(defun my/keyboard-quit-dwim ()
  "Do-What-I-Mean behaviour for a general `keyboard-quit'.

The generic `keyboard-quit' does not do the expected thing when
the minibuffer is open.  Whereas we want it to close the
minibuffer, even without explicitly focusing it.

The DWIM behaviour of this command is as follows:

- When the region is active, disable it.
- When a minibuffer is open, but not focused, close the minibuffer.
- When the Completions buffer is selected, close it.
- In every other case use the regular `keyboard-quit'."
  (interactive)
  (cond
   ((region-active-p)
    (keyboard-quit))
   ((derived-mode-p 'completion-list-mode)
    (delete-completion-window))
   ((> (minibuffer-depth) 0)
    (abort-recursive-edit))
   (t
    (keyboard-quit))))

(define-key global-map (kbd "C-g") #'my/keyboard-quit-dwim)

(defun my/html-sort-classes ()
  "Sort CSS classes in alphabetical order in an HTML document."
  (interactive)
  (save-excursion
    (while (search-forward "class=\"" nil t)
      (setq begin (point))
      (setq end (- (search-forward "\"" nil t) 1))
      (sort-regexp-fields nil "\\(\\sw\\|\\s_\\)+" "\\&" begin end))))

(with-eval-after-load 'mhtml-mode
  (keymap-set mhtml-mode-map "C-c f" 'my-html-sort-classes))

(provide 'init)
;;; init.el ends here
