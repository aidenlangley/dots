set ls "ls --color=auto"
abbr -a ls "$ls"
abbr -a lsa "$ls -A"
abbr -a mkd "mkdir -p" # Also mkcd, see function
abbr -a mkf mkfifo
abbr -a mv "mv -v"
abbr -a cp "cp -vr"
abbr -a rm "rm -v"
abbr -a bin "gio trash"

abbr -a ca bat
abbr -a gr "grep --color=auto"

abbr -a e "$EDITOR"
abbr -a z zellij
abbr -a ne nedots
abbr -a nv nvim
abbr -a py python

set syu "systemctl --user"
abbr -a sy systemctl
abbr -a sys "$syu"
abbr -a syd "$syu" daemon-reload
abbr -a syf "$syu" "list-units --failed"
abbr -a syr "$syu" restart
abbr -a syt "$syu" status
abbr -a pow "$sy" poweroff
abbr -a reb "$sy" reboot

abbr -a j "journalctl -xeb"
abbr -a jf "journalctl -xeb -f"

# git
abbr -a la lazygit
abbr -a gad 'git add'
abbr -a grm 'git rm'
abbr -a gs 'git status'
abbr -a gb 'git branch'
abbr -a gco 'git checkout'
abbr -a gpu 'git pull'
abbr -a gps 'git push'
abbr -a glo --set-cursor 'git log --oneline -%'

set gc 'git commit'
abbr -a gc "$gc"
abbr -a gcc "$gc -a"
abbr -a gcm "$gc -m"
abbr -a gcp "$gc -p"
abbr -a gcf "$gc -a -m \"fixup"
abbr -a gca "$gc --amend"

abbr -a gre --set-cursor 'git rebase -i HEAD~%'

function rebase_main
    set branch (git branch --show-current)
    echo "git checkout main && git rebase $branch && git branch -D $branch"
end
abbr -a grb -f rebase_main

# wifi
abbr -a wifi 'nmcli device wifi'

# cht.sh
set cheat 'cht.sh --lite'
abbr -a ch "$cheat"
abbr -a cheat "$cheat"

# supabase
abbr -a sb supabase
abbr -a supa supabase

# docker & podman
abbr -a po podman
abbr -a pod podman
abbr -a do docker
abbr -a dock docker

abbr -a podls 'podman ps -a'
abbr -a podrm 'podman rm -a'
abbr -a podbu --set-cursor 'podman build -t % .'
abbr -a podrun 'podman run -it --rm'
abbr -a podrund 'podman run -it --detach --name'
abbr -a podat 'podman attach'
abbr -a podst 'podman start --attach'

abbr -a lzd lazydocker

# utils
abbr -a L --position anywhere --set-cursor "% | less"
abbr -a C --position anywhere "| wc -"

# !!
function last_history_item
    echo sudo $history[1]
end
abbr -a !! --position anywhere -f last_history_item
