#!/usr/bin/env bash

session=$(find ~ -type d 2>/dev/null | fzf)
session_name=$(basename "$session" | tr . _)

if ! tmux has-session -t "$session_name"; then
  tmux new-session -s "$session_name" -c "$session" -d
fi
tmux switch-client -t "$session_name"
