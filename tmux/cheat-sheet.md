### Tmux Cheat Sheet

`[prefix] ?` - List of predefined tmux keybindings

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

### Panes

We can divide sessions into panes

- `[prefix] %` - Create a vertical pane down the middle of the session
- `[prefix] "` - Create a new Horizontal pane in the middle of the session
- `[prefix] o` - Cycle through panes
- `[prefix] up, down, left, right` - Change pane in that direction
- `[prefix] spacebar` - Cycle through pane layouts

#### Resizing Panes

- `[prefix] H` - Resize pane Left
- `[prefix] J` - Resize pane Down
- `[prefix] K` - Resize pane Up
- `[prefix] L` - Resize pane Right

#### Pane Layouts

- `even-horizontal` - stacks all panes horizontally
- `even-vertical` - stacks all panes vertically
- `main-horizontal` - Creates a large pane on top and smaller ones underneath
- `main-vertical` - Creates on large pane on the left and stacks the rest vertically on the right
- `tiled` - Arranges all panes evenly on the screen

### Command Mode

You can execute tmux commands from the command line, at the bottom status bar, by going into command mode and writting out a tmux command

- `[prefix] :` - Enters command mode

### Configuring tmux

The config file for tmux is `.tmux.cong` and it should live on the `/etc/` dir.
After making changes to this file, tmux doesn't automatically read them so we need to source tmux with the tmux command mode:

- `[prefix] : source-file ~./.tmux.conf`

# Running commands outside of Tmux

We can target our sessions with the `-t` flag, for example if we create a session called development

- `tmux new -s development`
  Then we can split a window like:
- `tmux split-window -h -t development`
  Now when we open the session `tmux attach -t development` we can see we have a window with two panes.

# Scripting a Project Configuration

We can create bash scripts for tmux and run them by going to the dir and running ./<scriptName>.sh

If you get a permission denied it usually means the script doesn't have execute permissions which can be fixed with:
`chmod +x <scriptName>.sh`

# Using the tmuxinator package to manage tmux

Tmuxinator gives us a nice environment for creating and managing tmux sessions.
To install it first make sure you have ruby `ruby -v`, if not download it with `sudo apt-get install ruby`
`gem install tmuxinator`

- `tmuxinator open <projectName>` - Create a new tmuxinator project