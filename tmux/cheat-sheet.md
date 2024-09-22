### Tmux Cheat Sheet

# Sessions

Sessions are standalone groups of terminals that can be configured for our liking. So you can have one for work, one for side projects etc.

- `tmux new -s <sessionName>` - Create a new session
- `tmux ls` - List all sessions
- `tmux attach -t <sessionName>` - Attach to a session
- `[pre-fix] d` - Detatch from the session
- `tmux kill-session -t <sessionName>` - Kill the session

### Windows

We can open multiple terminals within a tmux session

- `tmux [pre-fix] c` - Create a new window
- `[pre-fix] n` - Next window, toggles to the next window to the right
- `[pre-fix] p` - Previous window
- `[pre-fix] 0, 1, 2, 3 ...` - Go to a specific window at the given index
- `[pre-fix] ,` - Rename window
- `exit` - Closes a window
