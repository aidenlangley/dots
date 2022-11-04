#! /usr/bin/env bash

ZDOTDIR="$HOME"/.zsh
export ZDOTDIR

EDITOR=$(which nvim)
export EDITOR

PATH="$HOME"/bin:"$HOME"/.local/bin:/usr/local/go/bin:"$PATH"
export PATH