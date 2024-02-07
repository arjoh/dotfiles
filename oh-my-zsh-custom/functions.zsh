function gateway() { 
    if [ "${1}" = "-v" ]; then
        ip route show default
    else
        ip route show default|awk '{print $3}';
    fi
}