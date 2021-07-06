#!/usr/bin/env bash

# bogster colors for Tmux

set -g mode-style "fg=#59c0dc,bg=${fg_gutter}"

set -g message-style "fg=#59c0dc,bg=${fg_gutter}"
set -g message-command-style "fg=#59c0dc,bg=${fg_gutter}"

set -g pane-border-style "fg=${fg_gutter}"
set -g pane-active-border-style "fg=#59c0dc"

set -g status "on"
set -g status-justify "left"

set -g status-style "fg=#59c0dc,bg=#161C23"

set -g status-left-length "100"
set -g status-right-length "100"

set -g status-left-style NONE
set -g status-right-style NONE

set -g status-left "#[fg=#12161C,bg=#59c0dc,bold] #S #[fg=#59c0dc,bg=#161C23,nobold,nounderscore,noitalics]"
set -g status-right "#[fg=#161C23,bg=#161C23,nobold,nounderscore,noitalics]#[fg=#59c0dc,bg=#161C23] #{prefix_highlight} #[fg=${fg_gutter},bg=#161C23,nobold,nounderscore,noitalics]#[fg=#59c0dc,bg=${fg_gutter}] %Y-%m-%d  %I:%M %p #[fg=#59c0dc,bg=${fg_gutter},nobold,nounderscore,noitalics]#[fg=#12161C,bg=#59c0dc,bold] #h "

setw -g window-status-activity-style "underscore,fg=#c6b8ad,bg=#161C23"
setw -g window-status-separator ""
setw -g window-status-style "NONE,fg=#c6b8ad,bg=#161C23"
setw -g window-status-format "#[fg=#161C23,bg=#161C23,nobold,nounderscore,noitalics]#[default] #I  #W #F #[fg=#161C23,bg=#161C23,nobold,nounderscore,noitalics]"
setw -g window-status-current-format "#[fg=#161C23,bg=${fg_gutter},nobold,nounderscore,noitalics]#[fg=#59c0dc,bg=${fg_gutter},bold] #I  #W #F #[fg=${fg_gutter},bg=#161C23,nobold,nounderscore,noitalics]"
  