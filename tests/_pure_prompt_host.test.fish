source $DIRNAME/../functions/_pure_prompt_host.fish

test "colorize hostname (using reserved variable)"
    (
        set pure_host_color (set_color grey)
        set hostname 'hostname-variable'

        _pure_prompt_host

    ) = (set_color grey)'hostname-variable'
end

test "colorize hostname (using hostname executable)"
    (
        set --erase hostname
        function hostname  # mock
            echo 'hostname-executable'
        end

        set pure_host_color (set_color grey)

        _pure_prompt_host

        functions --erase hostname
    ) = (set_color grey)'hostname-executable'
end
