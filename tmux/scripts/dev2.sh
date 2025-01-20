#!/bin/bash

# Check if there's already a session called dev2
if ! tmux has-session -t dev2 2>/dev/null; then
  tmux new-session -s dev2 -n editor -d
  tmux send-keys -t dev2 'cd ~/repos' C-m
  # tmux send-keys -t dev2 'nvim .' C-m
  # tmux split-window -v -t dev2
  # tmux split-window -v -t dev2
  # tmux select-layout -t dev2 main-horizontal
  # tmux send-keys -t dev2:1.2 'cd ~/repos' C-m
  # tmux send-keys -t dev2:1.3 'cd ~/repos' C-m
  tmux new-window -n console -t dev2
  tmux send-keys -t dev2:2 'cd ~/repos' C-m
  tmux new-window -n git -t dev2
  tmux select-window -t dev2:1
fi
tmux attach -t dev2 
