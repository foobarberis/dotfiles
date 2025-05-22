;;; init.el -*- lexical-binding: t -*-
;;
;; Filename: init.el
;; Description:
;; Author: Oliems
;; Created: 2022-10-07 14:43 (+0200)
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

;; Add modules folder to load path
(dolist (path '("modules"))
  (add-to-list 'load-path (locate-user-emacs-file path)))

;; Package management and use-package macro
(require 'oli-straight.el)
(require 'oli-use-package.el)

;; Load $PATH correctly on macOS
(use-package exec-path-from-shell
  :straight t
  :init
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

;; Settings
(require 'oli-defaults.el)
(require 'oli-fontaine.el)
(require 'oli-keybindings.el)
(require 'oli-modeline.el)
(require 'oli-tab-bar.el)

;; Packages
;; Appearance
(require 'oli-ef-themes.el)
(require 'oli-pulsar.el)

;; Programming
(require 'oli-magit.el)
;; (require 'oli-eglot.el)
;; (require 'oli-fennel-mode.el)
;; (require 'oli-format-all.el)
;; (require 'oli-header2.el)
;; (require 'oli-janet-mode.el)
;; (require 'oli-lua-mode.el)
;; (require 'oli-tree-sitter.el)

;; Modal editing
(require 'oli-meow.el)

;; File management
(require 'oli-dired.el)

;; Media
(require 'oli-elfeed.el)

;; Org
(require 'oli-org-mode.el)
(require 'oli-org-modern.el)

;; Writing
(require 'oli-denote.el)
(require 'oli-logos.el)
(require 'oli-olivetti.el)

;; Completion and help system
(require 'oli-consult.el)
(require 'oli-embark.el)
(require 'oli-helpful.el)
(require 'oli-marginalia.el)
(require 'oli-orderless.el)
(require 'oli-vertico.el)
;; (require 'oli-corfu.el)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init.el ends here
