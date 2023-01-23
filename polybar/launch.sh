#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch bar 
# echo "---" | tee -a /tmp/polybar_top.log 
# polybar top 2>&1 | tee -a /tmp/polybar_top.log & disown
for m in $(polybar --list-monitors | cut -d":" -f1); do
    	# dpi=96
     	# height=27
    
#    if grep -q "DP" <<< "$m"; then
	#dpi=192
	#height=54
#    fi

    MONITOR=$m polybar --reload top &
done

# echo "Bars launched..."
