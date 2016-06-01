#! /bin/bash

SESSION=dataframe

tmux new-session -d -s $SESSION -n "source"
tmux send-keys -t $SESSION:"home" 'g flamingo && cd ./dataframe/source_files' Enter 

tmux new-window -n "test"  
tmux send-keys -t $SESSION:"test" 'g flamingo && cd ./dataframe/test' Enter 

tmux attach -t $SESSION 
