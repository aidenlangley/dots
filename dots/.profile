#! /usr/bin/env bash

PATH="$PATH":"$HOME"/.local/bin:"$HOME"/.npm:"$HOME"/.dotnet/tools:"$HOME"/go/bin:"$HOME"/.pub-cache/bin:"$HOME"/.symfony5/bin
PATH="$PATH":/usr/local/flutter/bin:/usr/local/go/bin
export PATH

EDITOR=$(which nvim)
export EDITOR

CHROME_EXECUTABLE=$(which chromium)
export CHROME_EXECUTABLE

DOCKER_HOST=unix://"$XDG_RUNTIME_DIR"/podman/podman.sock
export DOCKER_HOST
