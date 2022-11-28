#! /usr/bin/env bash
# shellcheck disable=1091,2034

ZIM_HOME=~/.zim
export ZIM_HOME

# Download zimfw plugin manager if missing
if [[ ! -e $ZIM_HOME/zimfw.zsh ]]; then
	curl -fsSL --create-dirs -o $ZIM_HOME/zimfw.zsh \
		https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
fi

# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated
if [[ ! $ZIM_HOME/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
	source $ZIM_HOME/zimfw.zsh init -q
fi

# Load core components first
# shellcheck disable=1090
source "$ZDOTDIR"/core/{functions,zkbd}.zsh

# Source these _before_ initializing modules
source_dir "$ZDOTDIR"/before

# Initialize modules
source $ZIM_HOME/init.zsh

# Source these _after_ initializing modules
source_dir "$ZDOTDIR"/after

# Config autosuggest
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8,bold"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=16

# Theme config
MNML_USER_CHAR=" "
MNML_NORMAL_CHAR="|"
MNML_INSERT_CHAR="›"

# duration-info
zstyle ':zim:duration-info' threshold 10
zstyle ':zim:duration-info' format '%F{red}%d%f '
add-zsh-hook preexec duration-info-preexec
add-zsh-hook precmd duration-info-precmd

MNML_RPS1=$RPS1
# shellcheck disable=2016
RPS1='$duration_info% '$MNML_RPS1

# prompt-pwd
zstyle ':zim:prompt-pwd' git-root yes
zstyle ':zim:prompt-pwd:tail' length 6
zstyle ':zim:prompt-pwd:fish-style' dir-length 3
zstyle ':zim:prompt-pwd:separator' format '❯'

# git-info
zstyle ':zim:git-info' verbose yes

# Must be sourced last apparently!
source $ZIM_HOME/modules/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# globalias expands aliases, excluding these:
# GLOBALIAS_FILTER_VALUES=(ls grep)

# starship this too!
# eval "$(starship init zsh)"
