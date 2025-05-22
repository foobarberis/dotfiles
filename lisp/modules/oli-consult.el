;;; oli-consult.el -*- lexical-binding: t -*-
;;
;; Filename: oli-consult.el
;; Description:
;; Author: Oliems
;; Created: 2022-10-07 15:09 (+0200)
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

(use-package consult
  :straight t
  :config
  (setq switch-to-buffer #'consult-buffer)
  (defun me/consult-find-home ()
    "Find a file in the Documents directory."
    (interactive)
    (consult-find "~/Documents/"))
  :bind
  ("H-m m" . 'consult-minor-mode-menu)
  ("C-s"   . 'consult-line)     ;; replace default isearch with consult-line
  ("H-c b" . 'consult-bookmark)
  ("H-c a" . 'consult-apropos)
  ("H-f"   . 'me/consult-find-home))

(provide 'oli-consult.el)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; oli-consult.el ends here
