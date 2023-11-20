#! /usr/bin/env bash

PATH="${HOME}"/bin:"${HOME}"/.local/bin:"${PATH}"
PATH="${PATH}":/usr/local/go/bin:"${HOME}"/go/bin              # go
PATH="${PATH}":"${HOME}"/.npm                                  # node
PATH="${PATH}":/usr/local/flutter/bin:"${HOME}"/.pub-cache/bin # dart
export PATH

EDITOR=$(which nvim)
export EDITOR

CHROME_EXECUTABLE=$(which chromium)
export CHROME_EXECUTABLE

DOCKER_HOST=unix://"${XDG_RUNTIME_DIR}"/podman/podman.sock
export DOCKER_HOST
