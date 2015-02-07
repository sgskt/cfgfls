# Key bindings
## French keyboard + remap capslock to ctrl
set-option -g prefix C-q
## VI keys
set-window-option -g mode-keys vi
bind-key -t vi-copy 'v' begin-selection
bind-key -t vi-copy 'y' copy-selection
## Prev-Next pane with C-j/C-k
bind j select-pane -t.-
bind k select-pane -t.+
## Prev-Next window with C-h/C-l
bind h select-window -p
bind l select-window -n
## Prev-Next session with C-g/C-m
bind g switch-client -p
bind m switch-client -n

# Colors
set -g default-terminal "screen-256color"
## Status bar
set-option -g status-bg colour0
set-option -g status-fg colour9
set-window-option -g window-status-fg colour10
set-window-option -g window-status-activity-fg colour2
set-window-option -g window-status-current-fg colour3
set-window-option -g window-status-current-bg colour0
## Pane borders
set-option -g pane-border-fg colour0
set-option -g pane-border-bg default
set-option -g pane-active-border-fg colour10
set-option -g pane-active-border-bg default
## Messages
set-option -g message-command-bg colour0
set-option -g message-command-fg colour5
set-option -g message-bg colour0
set-option -g message-fg colour5

# Status bar
set-option -g status-interval 2
## CPU and memory usage
set-option -g status-right-length 80
set-option -g status-right "#[fg=colour13]#(tmux-mem-cpu-load -i 2 -g 0)  #[fg=colour6]#(date +'%x %R')"

# Plugins
set -g @tpm_plugins '               \
    tmux-plugins/tpm                \
    tmux-plugins/tmux-copycat       \
'
run-shell '~/.tmux/plugins/tpm/tpm'
