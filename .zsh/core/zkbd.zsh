#! /usr/bin/env bash

# Sort out keybindings, they're a nightmare
# Delete key sends '^[[3~'
# Backspace sends ^?
# F1: ^[OP
# F2: ^[OQ
# F3: ^[OR
# F4: ^[OS
# F5: ^[[15~
# F6: ^[[17~
# F7: ^[[18~
# F8: ^[[19~
# F9: ^[[20~
# F10: ^[[21~
# F11: ^[[23~
# F12: ^[[24~
# Backspace: ^?
# Insert: ^[[2~
# Home: ^[[H
# PageUp: ^[[5~
# Delete: ^[[3~
# End: ^[[F
# PageDown: ^[[6~
# Up: ^[[A
# Left: ^[[D
# Down: ^[[B
# Right: ^[[C

# shellcheck disable=1090
source "$ZDOTDIR"/.zkbd/xterm-kitty-"${DISPLAY:t}"

# Originally this:
# source "$ZDOTDIR"/.zkbd/"$TERM"-${${DISPLAY:t}:-$VENDOR-$OSTYPE}

# An example:
# [[ -n ${key[Left]} ]] && bindkey "${key[Left]}" backward-char
# [[ -n ${key[Right]} ]] && bindkey "${key[Right]}" forward-char
