#!/bin/bash

if [ -z "$1" ]; then
	echo "Error: Session name not specified "
	exit 1
fi

SESSION=$1
# Start New Session with our name
tmux new-session -d -s $SESSION -x "$(tput cols)" -y "$(tput lines)"

tmux split-window -hl "20%"
tmux split-window -t2



# Attach Session, on the Main window
tmux attach-session -t $SESSION

