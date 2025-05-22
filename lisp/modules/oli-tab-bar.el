;;; oli-tab-bar.el -*- lexical-binding: t -*-
;;
;; Filename: oli-tab-bar.el
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

;; Display the time and battery level in the modeline or in the
;; tab-bar.
(use-package time
  :commands world-clock
  :config
  (setq display-time-format "%d-%m-%Y %H:%M")
  (setq display-time-interval 60)
  (setq display-time-mail-directory nil)
  (setq display-time-default-load-average nil)
  :hook (after-init . display-time-mode))

(use-package battery
  :hook (after-init . display-battery-mode))

;; By default, =tab-bar-format-align-right= will put everything as far
;; right as possible. For aesthetic reasons, we modify the function so
;; that we have a few spaces between the last character displayed and
;; the edge of the screen.
(eval-after-load "tab-bar"
  (defun tab-bar-format-align-right ()
    "Align the rest of tab bar items to the right."
    (let* ((rest (cdr (memq 'tab-bar-format-align-right tab-bar-format)))
	   (rest (tab-bar-format-list rest))
	   (rest (mapconcat (lambda (item) (nth 2 item)) rest ""))
	   (hpos (length rest))
	   ;; increase n in (- right ,hpos n) to move further to the
	   ;; left
	   (str (propertize " " 'display `(space :align-to (- right ,hpos 0)))))
      `((align-right menu-item ,str ignore)))))

;; This wrapper function makes sure that tabs are always added at the
;; end of the tab-bar.
(defun oli/tab-new-to ()
  "Create a new tab at the end of the tab-bar"
  (interactive)
  (tab-new-to -1))

;; This piece of code allows us to modify the way tab-hints look. For
;; example we could replace the numbers with Unicode characters like
;; circled numbers or even emojis.
(defvar oli/tab-numbers-alist
  '((0 . "0.")
    (1 . "1.")
    (2 . "2.")
    (3 . "3.")
    (4 . "4.")
    (5 . "5.")
    (6 . "6.")
    (7 . "7.")
    (8 . "8.")
    (9 . "9."))
  "Alist of integers to strings of circled unicode numbers.")

(defun oli/tab-bar-tab-name-format-default (tab i)
  (let ((current-p (eq (car tab) 'current-tab))
	(tab-num (if (and tab-bar-tab-hints (< i 10))
		     (alist-get i oli/tab-numbers-alist) "")))
    (propertize
     (concat " "
	     tab-num
	     " "
	     (alist-get 'name tab)
	     " ")
     'face (funcall tab-bar-tab-face-function tab))))
(setq tab-bar-tab-name-format-function #'oli/tab-bar-tab-name-format-default)

;; Settings
(tab-bar-mode 1)
(setq tab-bar-separator "")
(setq tab-bar-tab-hints t)
(setq tab-bar-close-button-show nil)
(setq tab-bar-format '(tab-bar-format-history
		       tab-bar-format-tabs
		       tab-bar-separator
		       tab-bar-format-align-right
		       tab-bar-format-global))

(provide 'oli-tab-bar.el)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; oli-tab-bar.el ends here
