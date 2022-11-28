if status is-login
    bass source ~/.profile
    bass source ~/.bash_profile
end

if status is-interactive
    # Source rust things
    bass source ~/.cargo/env

    # Switch on vi mode!
    fish_vi_key_bindings
end
