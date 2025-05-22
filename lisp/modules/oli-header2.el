;;; oli-header2.el -*- lexical-binding: t -*-
;;
;; Filename: oli-header2.el
;; Description:
;; Author: Oliems
;; Created: 2022-10-07 14:44 (+0200)
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

(use-package header2
  :straight t
  :config
  ;; Change date format to ISO
  (defun header-date-string ()
    "Current date and time."
    (format-time-string
     (cond ((stringp header-date-format) header-date-format)
           (header-date-format "%Y-%m-%d %H:%M (%z)")
           (t                  "%Y-%m-%dT%T%z")) ; An alternative: "%a %b %e %T %Y (UTC)"
     (current-time)
     (not header-date-format)))

  ;; Add lexical binding to header-title
  (defsubst header-title ()
    "Insert buffer's file name and leave room for a description.
In `emacs-lisp-mode', this should produce the title line for library
packages."
    (insert (concat comment-start
                    (and (= 1 (length comment-start))  header-prefix-string)
                    (if (buffer-file-name)
			(file-name-nondirectory (buffer-file-name))
                      (buffer-name))
                    " " "-*- lexical-binding: t -*-" "\n"))
    (setq return-to  (1- (point))))

  ;; Add only one newline character
  (defsubst header-code ()
  "Insert \"Code: \" line."
  (insert (concat (section-comment-start) "Code:" (nonempty-comment-end) "\n\n")))

  ;; Set header format
  (setq make-header-hook '(header-title
			   header-blank
			   header-file-name
			   header-description
			   header-author
			   header-copyright
			   header-creation-date
			   header-blank
			   header-end-line
			   header-commentary
			   header-blank
			   header-end-line
			   header-free-software
			   header-code
			   header-eof)))

(add-hook 'emacs-lisp-mode-hook 'auto-make-header)

(provide 'oli-header2.el)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; oli-header2.el ends here
