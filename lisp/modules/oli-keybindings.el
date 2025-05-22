;;; oli-keybindings.el -*- lexical-binding: t -*-
;;
;; Filename: oli-keybindings.el
;; Description:
;; Author: Oliems
;; Created: 2022-10-07 15:08 (+0200)
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
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

;; Remap Control to Command and Meta to Option on macOS keyboard.
;; These bindings are optimized for the HHKB Professional.
(setq ns-alternate-modifier 'meta)            ;; map Alt/Option to be Meta
(setq ns-command-modifier 'control)           ;; map Command to be Control
(setq ns-right-alternate-modifier 'none)      ;; map Right Alt/Option to be Meta
(setq ns-right-command-modifier 'hyper)       ;; map Right Control to be Hyper
(setq ns-control-modifier 'none)              ;; map Control to be Super

;; Switch bindings between default isearch and isearch with regexp
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Easier binding to switch windows
(global-set-key (kbd "H-o") 'other-window)

;; Easier delete window
(global-set-key (kbd "H-0") 'delete-window)

;; Easier split bindings
(global-set-key (kbd "H-[") 'split-window-right)
(global-set-key (kbd "H-]") 'split-window-below)

;; Disable s-* bindings
(global-unset-key (kbd "s-z"))
(global-unset-key (kbd "s-x"))
(global-unset-key (kbd "s-c"))
(global-unset-key (kbd "s-v"))
(global-unset-key (kbd "s-q"))

;; Disable suspend Emacs binding
(global-unset-key (kbd "C-z"))

;; Replace zap-to-char with zap-up-to-char
(global-set-key (kbd "M-z") 'zap-up-to-char)

;; Disable arrow keys
(global-unset-key (kbd "<left>"))
(global-unset-key (kbd "<right>"))
(global-unset-key (kbd "<up>"))
(global-unset-key (kbd "<down>"))
(global-unset-key (kbd "<C-left>"))
(global-unset-key (kbd "<C-right>"))
(global-unset-key (kbd "<C-up>"))
(global-unset-key (kbd "<C-down>"))
(global-unset-key (kbd "<M-left>"))
(global-unset-key (kbd "<M-right>"))
(global-unset-key (kbd "<M-up>"))
(global-unset-key (kbd "<M-down>"))

;; We define a couple of shorcuts for common functions pertaining to
;; tabs.
(global-set-key (kbd "H-t t") 'oli/tab-new-to)
(global-set-key (kbd "H-t k") 'tab-close)
(global-set-key (kbd "H-1") (lambda () (interactive) (tab-bar-select-tab 1)))
(global-set-key (kbd "H-2") (lambda () (interactive) (tab-bar-select-tab 2)))
(global-set-key (kbd "H-3") (lambda () (interactive) (tab-bar-select-tab 3)))
(global-set-key (kbd "H-4") (lambda () (interactive) (tab-bar-select-tab 4)))
(global-set-key (kbd "H-5") (lambda () (interactive) (tab-bar-select-tab 5)))
(global-set-key (kbd "H-6") (lambda () (interactive) (tab-bar-select-tab 6)))
(global-set-key (kbd "H-7") (lambda () (interactive) (tab-bar-select-tab 7)))
(global-set-key (kbd "H-8") (lambda () (interactive) (tab-bar-select-tab 8)))
(global-set-key (kbd "H-9") (lambda () (interactive) (tab-bar-select-tab 9)))

(provide 'oli-keybindings.el)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; oli-keybindings.el ends here
