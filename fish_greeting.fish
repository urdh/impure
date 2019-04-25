function fish_greeting --description 'Print the shell greeting'
    set -l c_n (set_color normal)
    set -l c_w (set_color cyan)

    set --local host (hostname)
    set --local arch (_pure_greeting_system)
    set --local term (tty | sed -e 's/.*tty\(.*\)/\1/')
    set --local time (date +%T)
    set --local zone (date +%Z)
    set --local date (date +%F)

    echo ""
    echo "  Welcome to $pure_color_info$host$pure_color_normal"
    echo "  Running $pure_color_info$arch$pure_color_normal on $pure_color_info$term$pure_color_normal"
    echo "  It is $pure_color_info$time$pure_color_normal ($zone) on $pure_color_info$date$pure_color_normal"
    echo ""
end
