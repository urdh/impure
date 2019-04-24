function _pure_greeting_system \
    --description 'Print system/architecture information for greeting.'

    set --local icon
    set --local full (uname -mrs)

    set --local system (uname -s)
    if test "$system" = "Darwin"
        set icon (printf "\uf302")
    else
        # TODO: other systems on https://github.com/Lukas-W/font-logos
        # Starts at \uf300 and ends at \uf31c; mind the inverse variants.
    end

    echo (string join ' ' $icon $full)
end
