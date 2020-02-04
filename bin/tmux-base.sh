#!/bin/bash
TMUX_BASE_WIDTH=$(($(tmux display-message -p '#{pane_width}') / 4))
tmux split-window -h
tmux resize-pane -x $TMUX_BASE_WIDTH
clear
tmux last-pane
clear

