tmux new-session -d bash
tmux split-window -h bash
tmux send -t 0:0.0 "./start_manager.sh" C-m
tmux send -t 0:0.1 "./start_relay.sh" C-m
tmux -2 attach-session -d