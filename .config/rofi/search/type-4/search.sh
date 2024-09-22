#!/bin/bash

dir="$HOME/.config/rofi/search/type-4"
theme='style-4'

# Default search engine
search_engine="https://duckduckgo.com/?q="

# Get the search query from Rofi
query=$(rofi -dmenu -p 'Web    ' -theme ${dir}/${theme}.rasi -normal-window)

# Check if the query is not empty
if [ -n "$query" ]; then
    # Open the URL in the default web browser
    xdg-open "${search_engine}${query}"
fi


