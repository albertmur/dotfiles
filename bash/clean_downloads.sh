#!/bin/bash

DOWNLOADS="$HOME/Downloads"

if [ -d "$DOWNLOADS" ]; then
    echo "Deleting all the content..."
    rm -rf "$DOWNLOADS"/*
    echo "Content removed."
else
    echo "The folder doesn't exist."
fi

