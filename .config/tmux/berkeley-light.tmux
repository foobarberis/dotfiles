white="#FFFFFF"
black="#000000"
grey="#9A9A9A"
green="#0A805D"
gold="#FEB908"
orange="#E25600"
red="#B73A34"

# Status bar
set-option -g status-style "bg=$orange,fg=$white"

# Window list
set-window-option -g window-status-style "bg=$orange,fg=$white"
set-window-option -g window-status-current-style "bg=$gold,fg=$black,bold"
set-window-option -g window-status-activity-style "bg=$orange,fg=$white"
set-window-option -g window-status-bell-style "bg=$red,fg=$white,bold"
set-window-option -g window-status-separator " "
set-window-option -g window-status-format " #I:#W"
set-window-option -g window-status-current-format " #I:#W"

# Panes
set-option -g pane-border-style "fg=$grey"
set-option -g pane-active-border-style "fg=$gold"
set-option -g pane-border-lines heavy
set-option -g display-panes-colour "$orange"
set-option -g display-panes-active-colour "$gold"

# Messages and prompts
set-option -g message-style "bg=$gold,fg=$black"
set-option -g message-command-style "bg=$gold,fg=$black"

# Copy mode
set-window-option -g mode-style "bg=$gold,fg=$black"
set-window-option -g copy-mode-match-style "bg=$orange,fg=$white"
set-window-option -g copy-mode-current-match-style "bg=$green,fg=$white"

# Status segments
set-option -g status-left-length 20
set-option -g status-left "#[bg=$green,fg=$white,bold] #S #[bg=$orange,fg=$white]"
set-option -g status-right " %Hh%M - %d/%m/%Y "
