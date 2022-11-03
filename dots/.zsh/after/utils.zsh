#! /usr/bin/env bash

# A string of dots becomes a means of escape. The dots must be rationalized if
# we're to make it out alive.
rationalise-dot() {
	if [[ $LBUFFER = *.. ]]; then
		LBUFFER+=/..
	else
		LBUFFER+=.
	fi
}
zle -N rationalise-dot
bindkey . rationalise-dot

# Generate random number
rand() {
	usage="Usage: rand 1000, returns random number between 0-999"
	[[ "$1" -gt 0 ]] && echo $((RANDOM % $1)) || echo "$usage"
}
