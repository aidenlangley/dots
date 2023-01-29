set journal "journalctl -xeb"
abbr -a j "$journal"
abbr -a jf "$journal -f"

abbr -a cp "cp -vr"
abbr -a del "rm -vr"
abbr -a delf "rm -vrf"
abbr -a mk "mkdir -p" # Also mkcd, see function
abbr -a mv "mv -v"
abbr -a rm "gio trash"

# ls aliased to exa
abbr -a la "exa -a"
abbr -a las "exa -als"
abbr -a lad "exa -aT -L"
abbr -a ll "exa -l"
abbr -a lls "exa -ls"
abbr -a lld "exa -lT -L"
abbr -a ls exa
abbr -a lsd "exa -T -L"

abbr -a ca bat
abbr -a cat bat
abbr -a cht "cht.sh"
abbr -a e "$EDITOR"
abbr -a lg lazygit
abbr -a ne nedots
abbr -a nv nvim
abbr -a py python
abbr -a to touch

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

# nu shell passthroughs
abbr -a nls "nu -c ls"
abbr -a nla "nu -c 'ls -a'"
abbr -a nll "nu -c 'ls -l'"

# git
abbr -a ga "git add"
abbr -a gb "git branch"
abbr -a gc "git commit -m"
abbr -a gco "git checkout"
abbr -a gp "git pull"
abbr -a gP "git push"
abbr -a gs "git status"

# wifi
abbr -a wifi "nmcli device wifi"
