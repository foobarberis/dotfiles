;;; oli-fontaine.el -*- lexical-binding: t -*-
;;
;; Filename: oli-fontaine.el
;; Description:
;; Author: Oliems
;; Created: 2022-10-08 15:05 (+0200)
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

(use-package fontaine
  :straight t
  :config
  (setq fontaine-presets
	'((regular
	   ;; I keep all properties for didactic purposes, but most can be
	   ;; omitted.
	   :default-family "Iosevka SS12"
	   :default-weight regular
	   :default-height 160
	   :fixed-pitch-family "Iosevka Fixed SS12"
	   :variable-pitch-family "Iosevka Etoile"
	   :variable-pitch-weight regular
	   :variable-pitch-height 160
	   :bold-weight nil
	   :italic-slant italic
	   :line-spacing 1)))

  ;; Set last preset or fall back to desired style from `fontaine-presets'.
  (fontaine-set-preset (or (fontaine-restore-latest-preset) 'regular))

  ;; The other side of `fontaine-restore-latest-preset'.
  (add-hook 'kill-emacs-hook #'fontaine-store-latest-preset))

(provide 'oli-fontaine.el)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; oli-fontaine.el ends here
