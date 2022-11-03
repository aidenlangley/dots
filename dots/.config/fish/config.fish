# Basically just runs at TTY
if status is-login
end

# Any interactive shell spawned post-login
if status is-interactive
    starship init fish | source
end
