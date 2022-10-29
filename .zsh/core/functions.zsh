#! /usr/bin/env bash

source_dir() {
	if [[ -d $1 ]]; then
		if [ "$(ls -A "$1")" ]; then
			for f in "$1"/*.zsh; do
				# shellcheck disable=1090
				source "$f"
			done
		fi
	fi
}

rm() {
	trash="$HOME/.local/share/Trash/files"
	mv -v "$1" "$trash"
}

uptime() {
    command uptime | awk '/up/{print $3,$4}' | sed 's/\(.*\),/\1 /'
}
