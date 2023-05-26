if status is-login
    bass source ~/.profile
end

if status is-interactive
    # Source rust things
    bass source ~/.cargo/env

    # Use LTS nodejs
    nvm use lts &>/dev/null
end
