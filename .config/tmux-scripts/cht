#!/usr/bin/env bash
options=$(curl --silent https://cht.sh/:list | fzf | xargs basename)
read -p "Enter Query: " query
result=$(curl --silent https://cht.sh/$options/$(echo "$query" | tr " " "+"))
tmux split-window -v "echo -e \"$result\" | less -R"
