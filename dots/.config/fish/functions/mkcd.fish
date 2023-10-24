function mkcd --description 'Make a directory & cd into it' --argument dir
    mkdir -p "$dir"
    cd "$dir"
end
