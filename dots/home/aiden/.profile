#! /usr/bin/env bash

PATH="$HOME"/bin:"$HOME"/.local/bin:"$HOME"/.npm:"$HOME"/.dotnet/tools:"$PATH"
PATH=/usr/local/flutter/bin:/usr/local/go/bin:"$PATH"
export PATH

EDITOR=$(which nvim)
export EDITOR

CHROME_EXECUTABLE=$(which chromium)
export CHROME_EXECUTABLE

DOCKER_HOST=unix://"$XDG_RUNTIME_DIR"/podman/podman.sock
export DOCKER_HOST
