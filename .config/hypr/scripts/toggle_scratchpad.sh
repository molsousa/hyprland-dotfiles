#!/bin/bash
# Usage: toggle_scratchpad.sh CLASS_NAME COMMAND [SIZE]

CLASS="$1"
COMMAND="$2"
SIZE="${3:-scratchpad}"  # default: scratchpad

# Verifica se a janela já existe
if hyprctl clients | grep -q "class: $CLASS"; then
    # Se existe, esconde (move para scratchpad)
    hyprctl dispatch movetoworkspace silent special:"$SIZE"
else
    # Se não existe, abre e move para scratchpad
    $COMMAND &
    sleep 0.3
    hyprctl dispatch movetoworkspace silent special:"$SIZE"
fi
