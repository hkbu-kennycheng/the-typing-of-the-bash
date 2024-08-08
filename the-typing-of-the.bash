#!/bin/bash

# This is a simple typing game that uses fortune and cowsay.
# The game will display a random fortune and the player will have to type it out.

# Generate a random fortune and cow
text="$(fortune -e love | head -n 1)"
cow=$(cowsay -l | shuf -n 1)

# main loop
while [ ! -z "$text" ]; do
    # Display the fortune
    clear && echo "$text" | cowsay -nC -f $cow || break

    read -sn1 key
    if [ -z "$key" ]; then
        [ "${text:0:1}" = " " ] && text="${text:1}"
    else
        text="$(echo "$text" | sed -e "s/^[$key]//")"
    fi
done
clear
