(defvar my/theme-list '(modus-operandi modus-vivendi)
  "List of themes to toggle between.")

(defvar my/current-theme-index 0
  "Index of the currently enabled theme in `my/theme-list`.")

(defun my/load-theme-by-index (index)
  "Load the theme at INDEX in `my/theme-list`, disabling others."
  (when (nth index my/theme-list)
    (mapc #'disable-theme custom-enabled-themes)
    (load-theme (nth index my/theme-list) t)))

(defun my/toggle-themes ()
  "Toggle between themes listed in `my/theme-list`."
  (interactive)
  (setq my/current-theme-index
        (mod (1+ my/current-theme-index) (length my/theme-list)))
  (my/load-theme-by-index my/current-theme-index))
  
(global-set-key (kbd "<f9>") #'my/toggle-themes)
