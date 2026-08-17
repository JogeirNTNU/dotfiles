#!/bin/bash
sleep 5
# Force NVIDIA to re-negotiate with DP-1
hyprctl dispatch dpmsoff DP-1
sleep 2
hyprctl dispatch dpmson DP-1
sleep 2
hyprctl reload
