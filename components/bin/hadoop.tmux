#! /bin/bash

SESSION=hadoop

tmux new-session -d -s $SESSION -n "home"
tmux send-keys -t $SESSION:"home" 'g exercises && cd hadoop' Enter 

tmux new-window -n "hadoop1"  
tmux send-keys -t $SESSION:"hadoop1" 'ssh john@hadoop1' Enter 

tmux new-window -n "hadoop2" 
tmux send-keys -t $SESSION:"hadoop2" 'ssh john@hadoop2' Enter 

tmux new-window -n "hadoop3" 
tmux send-keys -t $SESSION:"hadoop3" 'ssh john@hadoop3' Enter 


tmux attach -t $SESSION 
