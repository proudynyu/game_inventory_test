#!/bin/bash

TARGET_DIR="bin"
FILENAME="inventory"
BIN="./$TARGET_DIR/$FILENAME"

if [ ! -d "./$TARGET_DIR" ]; then
    mkdir "./$TARGET_DIR"
fi

odin build . -out:"$BIN"
./$BIN
