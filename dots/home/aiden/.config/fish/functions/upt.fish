function upt -d "Succint uptime"
    echo (string split " " (string replace "  " " " (uptime) | string split ",")[1])[4]
end
