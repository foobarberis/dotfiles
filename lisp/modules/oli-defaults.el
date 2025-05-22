;;; oli-defaults.el -*- lexical-binding: t -*-
;;
;; Filename: oli-defaults.el
;; Description:
;; Author: Oliems
;; Created: 2022-10-07 15:06 (+0200)
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;; BUG :: Minibuffer history is not loaded correctly when
;; savehist-file is not set to the default value e.g
;; ~/.emacs.d/history
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or (at
;; your option) any later version.
;;
;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <https://www.gnu.org/licenses/>.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

;; Set a cache directory to store automatically generated files
(setq oli-cache-directory (concat user-emacs-directory "cache/"))

;; Start Emacs in fullscreen or select size of startup frame
;; (add-hook 'window-setup-hook 'toggle-frame-fullscreen t)

;; Disable default startup screen
(setq inhibit-startup-message nil)

;; Disable scroll bars and menu bars
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(horizontal-scroll-bar-mode -1)
(fringe-mode 10)

;; Prefer a still cursor
(blink-cursor-mode 0)

;; Replace region when inserting text
(delete-selection-mode 1)

;; Iterate through CamelCase words
(global-subword-mode 1)

;; Highlight the current line
(global-hl-line-mode -1)

;; Revert buffers when the underlying file has changed
(global-auto-revert-mode 1)

;; Enable line wrapping
(global-visual-line-mode 1)

;; Show matching parentheses
(show-paren-mode 1)

;; When you visit a file, point goes to the last place where it was when you
;; previously visited the same file.
(save-place-mode 1)

;; Enable minibuffer history
(savehist-mode 1)

;; Default to utf-8 encoding
(set-default-coding-systems 'utf-8)

;; Time, in seconds, between Auto-Revert Mode file checks.
(setq auto-revert-interval 30)

;; If non-nil Auto-Revert Mode reliably updates version control info.
;; This ensures that the VC information in the modeline is updated automatically.
(setq auto-revert-check-vc-info t)

;; Move custom settings to custom.el
(setq custom-file (expand-file-name "custom.el" oli-cache-directory))

;; Disable ring bell
(setq ring-bell-function 'ignore)

;; Column beyond which automatic line-wrapping should happen.
(setq fill-column 80)

;; Enable recursive minibuffers
(setq enable-recursive-minibuffers nil)

;; File backup settings
(setq backup-directory-alist
      `(("." . ,(concat oli-cache-directory "backup/"))))
(setq backup-by-copying t)
(setq version-control t)
(setq delete-old-versions t)
(setq kept-new-versions 6)
(setq kept-old-versions 2)
(setq create-lockfiles nil)
(setq load-prefer-newer t)
(setq auto-save-list-file-prefix nil)         ;; Prevent tracking for auto-saves

;; Save clipboard text into kill ring before replacing it
(setq save-interprogram-paste-before-kill t)

;; Make apropos command search more extensively
(setq apropos-do-all t)

;; Restore some of the disabled commands
(put 'dired-find-alternate-file 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;; Hide the cursor in inactive windows
(setq cursor-in-non-selected-windows nil)

;; Prefer kebab-case for titles and symbols
(setq custom-unlispify-menu-entries nil)
(setq custom-unlispify-tag-names nil)

;; Delete files to trash
(setq delete-by-moving-to-trash t)

;; Focus new help windows when opened
(setq help-window-select t)

;; Stop using tabs to indent
(indent-tabs-mode nil)

;; Yank at point rather than pointer
(setq mouse-yank-at-point t)

;; Increase read size for data chunks
(setq read-process-output-max (* 1024 1024))

;; Set re-centering positions
(setq recenter-positions '(5 bottom))

;; Nice scrolling
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; Merge system's and Emacs' clipboard
(setq select-enable-clipboard t)

;; Use a single space after dots
(setq sentence-end-double-space nil)

;; Disable help text everywhere
(setq show-help-function nil)

;; Indent first then try completions
(setq tab-always-indent 'complete)

;; Smaller width for tab characters
(setq tab-width 4)

;; Uniquify buffer names
(setq uniquify-buffer-name-style 'forward)

;; Replace yes/no prompts with y/n
(setq use-short-answers t)

;; Resize windows proportionally
(setq window-combination-resize t)

;; Stretch cursor to the glyph width
(setq x-stretch-cursor t)

;; Specify the path to Ghostscript
(setq doc-view-ghostscript-program "/opt/homebrew/bin/gs")

;; Store automatically generated files in .emacs.d/cache to avoid
;; clutter
(setq save-place-file (concat oli-cache-directory "places"))
(setq transient-history-file (concat oli-cache-directory "transient/history.el"))
(setq bookmark-default-file (concat oli-cache-directory "bookmarks"))
;; (setq savehist-file (concat oli-cache-directory "history"))
(setq fontaine-latest-state-file (concat oli-cache-directory "fontaine-latest-state.eld"))
(setq url-configuration-directory (concat oli-cache-directory "url/"))

(provide 'oli-defaults.el)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; oli-defaults.el ends here
