#!/bin/bash

# Check if there's already a session called development
if ! tmux has-session -t development 2>/dev/null; then
  tmux new-session -s development -n editor -d
  tmux send-keys -t development 'cd ~/repos' C-m
  tmux send-keys -t development 'nvim .' C-m
  tmux split-window -v -t development
  tmux split-window -v -t development
  tmux send-keys -t development:1.2 'cd ~/repos' C-m
  tmux send-keys -t development:1.3 'cd ~/repos' C-m
  tmux new-window -n console -t development
  tmux send-keys -t development:2 'cd ~/repos' C-m
  tmux select-window -t development:1
fi
tmux attach -t development
