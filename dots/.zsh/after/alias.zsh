#! /usr/bin/env bash
# shellcheck disable=2139

# -------------------------------------------------------------------------
# Aliases & utility functions
# -------------------------------------------------------------------------
# alias:
# -------------------------------------------------------------------------
#   -g  global  Can autocomplete globally, useful for piping.
#   -s  suffix  Assign a program to a suffix, e.g. `alias -s txt=lvim`.
#               Running `new.txt` will create the file & open LunarVim.
# -------------------------------------------------------------------------
# Reset all aliases:
#   unalias -m '*'
# -------------------------------------------------------------------------

# Alias to alias
alias al="alias -L | bat -l bash"

# Common ops & utils
alias cp="cp -vr"
alias del="command rm -vr"
alias delf="command rm -vrf"
alias mk="mkdir -vp"
alias mv="mv -v"
alias count="wc -l <"
alias env="env | less"

# Shortcuts
alias e=lvim
alias g=lazygit
alias k=pkill
alias lv=lvim
alias nv=nvim
alias m=man
alias py=python
alias r=riverctl
alias t=touch
alias {c,cat}=bat
alias {h,help}=run-help

# asdf handles some of our bits
# alias direnv="asdf exec direnv" # direnv module handles this
alias npm="asdf exec npm"
alias {py,python}="asdf exec python"

# journal
alias jo="journalctl -xeb"
alias jf="journalctl -xeb -f"

# systemd
alias sy=systemctl
alias syst="systemctl status"
alias su="systemctl --user"
alias suf="su list-units --failed"
alias sud="su daemon-reload"
alias po="systemctl poweroff"
alias re="systemctl reboot"

# zimfw
alias z=zimfw
alias zb="z build"
alias zc="z clean"
alias zp="z compile"
alias zi="z install"
alias zl="z list"
alias zr="zimfw clean && zimfw build && zimfw compile"

# Useful globals
alias -g dv=/dev/null
alias -g c="| wc -l"
