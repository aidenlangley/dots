#! /usr/bin/env bash
# shellcheck disable=2154

# Whilst in insert mode, the arrow keys will allow us to move backwards &
# forwards by a word whilst holding Control
bindkey -v "${terminfo[kLFT5]}" vi-backward-word
bindkey -v "${terminfo[kRIT5]}" vi-forward-word
