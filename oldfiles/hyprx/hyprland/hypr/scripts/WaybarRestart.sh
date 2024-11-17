#!/bin/bash

restart_waybar() {
  # if pgrep -x "waybar" >/dev/null; then
  #   pkill waybar
  #   sleep 0.1 # Delay for Waybar to completely terminate
  # fi
  _ps=(waybar)
  for _prs in "${_ps[@]}"; do
    if pidof "${_prs}" >/dev/null; then
      pkill "${_prs}"
    fi
  done
  sleep 0.3
  # Relaunch waybar
  waybar &

}

restart_waybar
