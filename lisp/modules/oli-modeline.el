;;; oli-modeline.el -*- lexical-binding: t -*-
;;
;; Filename: oli-modeline.el
;; Description:
;; Author: Oliems
;; Created: 2022-10-07 15:08 (+0200)
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;; TODO Make modeline a bit taller.
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

;; This function allows us to align elements in the modeline to right
;; or to the left.
(defun me/simple-mode-line-render (left right)
  "Return a string of `window-width' length.  Containing LEFT, and
  RIGHT aligned respectively."
  (let ((available-width
	 (- (window-total-width)
	    (+ (length (format-mode-line left))
	       (length (format-mode-line right))))))
    (append left
	    (list (format (format "%%%ds" available-width) ""))
	    right)))

;; Set modline format
(setq-default
 mode-line-format
 '((:eval
    (me/simple-mode-line-render
     ;; Left.
     (quote (" "
	     mode-line-mule-info
	     mode-line-client
	     mode-line-modified
	     mode-line-remote
	     "  "
	     (:eval (when (bound-and-true-p meow-mode) (concat (propertize (meow-indicator) 'face 'bold) " ")))
	     "L%l"))
     ;; Right.
     (quote (
	     (vc-mode vc-mode)
	     "   "
	     "%b "
	     "["mode-name"]"
	     " "))))))

(provide 'oli-modeline.el)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; oli-modeline.el ends here
