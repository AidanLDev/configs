tmux new-session -s development -n editor -d
tmux send-keys -t development 'cd ~/repos' C-m
tmux send-keys -t development 'nvim .' C-m
tmux split-window -v -t development main-horizontal
tmux send-keys -t development:1.2 'cd ~/repos' C-m
tmux new-window -n console -t development
tmux send-keys -t development:2 'cd ~/repos' C-m
tmux select-window -t development:1
tmux attach -t development