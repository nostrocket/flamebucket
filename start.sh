export PATH="$PATH:$HOME/.local/bin" #if manually installed protobuf
tmux new-session -d bash
tmux split-window -h bash
tmux send -t 0:0.0 "./start_manager.sh" C-m
sleep 1
tmux send -t 0:0.1 "./start_relay.sh" C-m
tmux -2 attach-session -d