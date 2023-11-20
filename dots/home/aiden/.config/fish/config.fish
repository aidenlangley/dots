if status is-login
    bass source ~/.profile
end

if status is-interactive
    # Source rust things
    bass source ~/.cargo/env

    # Use LTS nodejs
    nvm use lts &>/dev/null

    # Autostart a zellij session
    # set -x ZELLIJ_AUTO_EXIT true
    # eval (zellij setup --generate-auto-start fish | string collect)
end
