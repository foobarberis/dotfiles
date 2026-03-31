white="#F7F4EE"
black="#1E1B18"
green="#0A7F5D"
blue="#006EC3"
orange="#CB3F00"
red="#B73A34"
highlight="#E1DED9"  # 10% ink-on-paper highlight (matches Vim Visual/Search)

# Status bar
set-option -g status-style "bg=$white,fg=$black"

# Window list
set-window-option -g window-status-style "bg=$white,fg=$black"
set-window-option -g window-status-current-style "bg=$white,fg=$black,bold"
set-window-option -g window-status-activity-style "bg=$white,fg=$blue,bold"
set-window-option -g window-status-bell-style "bg=$white,fg=$red,bold"
set-window-option -g window-status-separator " "
set-window-option -g window-status-format " #I:#W"
set-window-option -g window-status-current-format " [#I:#W]"

# Panes
set-option -g pane-border-style "fg=$black,bold"
set-option -g pane-active-border-style "fg=$blue,bold"
set-option -g pane-border-lines simple
set-option -g display-panes-colour "$blue"
set-option -g display-panes-active-colour "$orange"

# Messages and prompts
set-option -g message-style "bg=$orange,fg=$black"
set-option -g message-command-style "bg=$orange,fg=$black"

# Copy mode
set-window-option -g mode-style "bg=$highlight,fg=$black"
set-window-option -g copy-mode-position-style "bg=$highlight,fg=$black"
set-window-option -g copy-mode-selection-style "bg=$highlight,fg=$black"
set-window-option -g copy-mode-match-style "bg=$highlight,fg=$black"
set-window-option -g copy-mode-current-match-style "bg=$highlight,fg=$black"

# Status segments
set-option -g status-left-length 20
set-option -g status-left "#[bg=$white,fg=$black,bold] #S #[bg=$white,fg=$black]"
set-option -g status-right " %Hh%M - %d/%m/%Y "
