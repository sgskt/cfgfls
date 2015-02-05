set -g default-terminal "screen-256color"
set-window-option -g mode-keys vi
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

set-option -g status-bg colour0
set-option -g status-fg colour14
set-window-option -g window-status-fg colour10
set-window-option -g window-status-current-fg colour14
set-window-option -g window-status-current-bg colour8
