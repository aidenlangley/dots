set journal "journalctl -xeb"
abbr -a j "$journal"
abbr -a jf "$journal -f"

abbr -a bin "gio trash"
abbr -a cp "cp -vr"
abbr -a grep "grep --color=auto"
abbr -a ls "ls --color=auto"
abbr -a mkdir "mkdir -p" # Also mkcd, see function
abbr -a mv "mv -v"
abbr -a rm "rm -v"

abbr -a ca bat
abbr -a cat bat

abbr -a e "$EDITOR"
abbr -a gg lazygit
abbr -a ne nedots
abbr -a nv nvim
abbr -a py python

abbr -a count "wc -l"
abbr -a alias "abbr -l"
abbr -a env "env | less"

set sy systemctl
set syu "$sy --user"
abbr -a sy "$sy"
abbr -a sys "$syu"
abbr -a syd "$syu" daemon-reload
abbr -a syf "$syu" "list-units --failed"
abbr -a syr "$syu" restart
abbr -a syt "$syu" status
abbr -a pow "$sy" poweroff
abbr -a reb "$sy" reboot

# git
abbr -a lg lazygit
abbr -a ga "git add"
abbr -a gb "git branch"
abbr -a gc "git commit -m"
abbr -a gco "git checkout"
abbr -a gp "git pull"
abbr -a gP "git push"
abbr -a gs "git status"

# wifi
abbr -a wifi "nmcli device wifi"

# cht.sh
set cheat "cht.sh --lite"
abbr -a ch "$cheat"
abbr -a cheat "$cheat"

# supabase
abbr -a sb supabase
