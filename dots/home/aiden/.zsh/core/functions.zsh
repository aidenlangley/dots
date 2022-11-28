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
