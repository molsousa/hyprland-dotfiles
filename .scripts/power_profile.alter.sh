#!/bin/bash

current_profile=$(powerprofilesctl get)

profiles=("power-saver" "balanced" "performance")

next_index=0
for i in "${!profiles[@]}"; do
    if [[ "${profiles[$i]}" == "$current_profile" ]]; then
        next_index=$(( (i + 1) % ${#profiles[@]} ))
        break
    fi
done

powerprofilesctl set "${profiles[$next_index]}"
