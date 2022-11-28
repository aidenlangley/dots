function upt -d "Succint uptime"
    echo (string split '  ' (string split ',' (uptime)))[2]
end
