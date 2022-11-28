function fish_greeting
    set greeting (date +"%d %b, %Y ~ %R%Z") "~"
    set -a greeting (TZ='UTC' date +"(%d)%R%Z") "|"
    set -a greeting "up for" (upt) "|"
    set -a greeting (pacman -Qeq | wc -l) packages
    set_color brblack
    echo $greeting
end
