#!/usr/bin/env bash

# Berkeley light theme for Tmux
# Minimalist palette with an orange status line

white="#FFFFFF"
black="#000000"
grey="#9A9A9A"
green="#0A805D"
gold="#FEB908"
orange="#E25600"
red="#B73A34"

# Status bar
tmux set-option -g status-style "bg=$orange,fg=$white"

# Window list
tmux set-window-option -g window-status-style "bg=$orange,fg=$white"
tmux set-window-option -g window-status-current-style "bg=$gold,fg=$black,bold"
tmux set-window-option -g window-status-activity-style "bg=$orange,fg=$white"
tmux set-window-option -g window-status-bell-style "bg=$red,fg=$white,bold"
tmux set-window-option -g window-status-separator " "
tmux set-window-option -g window-status-format " #I:#W"
tmux set-window-option -g window-status-current-format " #I:#W"

# Panes
tmux set-option -g pane-border-style "fg=$grey"
tmux set-option -g pane-active-border-style "fg=$gold"
tmux set-option -g display-panes-colour "$orange"
tmux set-option -g display-panes-active-colour "$gold"

# Messages and prompts
tmux set-option -g message-style "bg=$gold,fg=$black"
tmux set-option -g message-command-style "bg=$gold,fg=$black"

# Copy mode
tmux set-window-option -g mode-style "bg=$gold,fg=$black"
tmux set-window-option -g copy-mode-match-style "bg=$orange,fg=$white"
tmux set-window-option -g copy-mode-current-match-style "bg=$green,fg=$white"

# Status segments
tmux set-option -g status-left-length 20
tmux set-option -g status-left "#[bg=$green,fg=$white,bold] #S #[bg=$orange,fg=$white]"
tmux set-option -g status-right " %Hh%M - %d/%m/%Y "
