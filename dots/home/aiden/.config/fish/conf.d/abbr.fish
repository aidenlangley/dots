# Shortcut abbr to include -a/--add
set abbr (abbr -a)

set journal "journalctl -xeb"
abbr j "$journal"
abbr jf "$journal -f"

abbr cp "cp -vr"
abbr del "rm -vr"
abbr delf "rm -vrf"
abbr mk "mkdir -p" # Also mkcd, see function
abbr mv "mv -v"
abbr rm "gio trash"

# ls aliased to exa
abbr la "exa -a"
abbr las "exa -als"
abbr lad "exa -aT -L"
abbr ll "exa -l"
abbr lls "exa -ls"
abbr lld "exa -lT -L"
abbr ls exa
abbr lsd "exa -T -L"

abbr ca bat
abbr e "$EDITOR"
abbr nv nvim
abbr py python
abbr to touch
abbr cht "cht.sh"

abbr count "wc -l"
abbr alias "abbr -l"
abbr env "env | less"

set sy systemctl
set syu "$sy --user"
abbr sy "$sy"
abbr sys "$syu"
abbr syd "$syu" daemon-reload
abbr syf "$syu" "list-units --failed"
abbr syr "$syu" restart
abbr syt "$syu" status
abbr pow "$sy" poweroff
abbr reb "$sy" reboot

# nu shell passthroughs
abbr nls "nu -c ls"
abbr nla "nu -c 'ls -a'"
abbr nll "nu -c 'ls -l'"

# git
abbr gco "git checkout"
abbr gst "git status"
