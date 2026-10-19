#!/usr/bin/env bash
layout=$(hyprctl activeworkspace -j | jq -r '.tiledLayout')

case "$layout" in
  dwindle)   icon="󰕮" ;;   
  master)    icon="󰙀" ;;   
  monocle)   icon="" ;;   
  scrolling) icon="󰕬" ;;   
  *)         icon="󰕶" ;;   
esac

echo "$icon $layout"

