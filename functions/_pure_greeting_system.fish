function _pure_greeting_system \
    --description 'Print system/architecture information for greeting.'

    # Helper for running `which`
    function has_command \
        --argument-names command_name
        command which $command_name 2>/dev/null >/dev/null
    end

    # Helper for reading `env`-style files
    function get_variable \
        --argument-names key input_file
        cat $input_file | \
            grep -E "^$key=" | \
            string replace "$key=" '' | \
            string trim --chars "\"'"
    end

    set --local os_icon
    set --local os_name
    set --local os_version

    if has_command sw_vers
        # This is macOS, and sw_vers will tell us which version
        set os_icon \uf302
        set os_name (sw_vers -productName)
        set os_version (sw_vers -productVersion)
    else if has_command freebsd-version
        # This is FreeBSD, and freebsd-version will tell us which version
        set os_icon \uf30c
        set os_name FreeBSD
        set os_version (freebsd-version -f)
    else if test -f /etc/os-release
        # Linux distribution with an /etc/os-release
        set os_name (get_variable NAME /etc/os-release)
        set os_version (get_variable VERSION /etc/os-release)
        set --local os_id (get_variable ID /etc/os-release)
        switch "$os_id"
            case alpine
                set os_icon \uf300
            case aosc
                set os_icon \uf301
            case arch
                set os_icon \uf303
            case centos
                set os_icon \uf304
            case coreos
                set os_icon \uf305
            case debian
                set os_icon \uf306
            case deuvan
                set os_icon \uf307
            case 'elementary OS'
                set os_icon \uf309
            case fedora
                set os_icon \uf30a
            case gentoo
                set os_icon \uf30d
            case linuxmint
                set os_icon \uf30e
            case manjaro
                set os_icon \uf312
            case nixos
                set os_icon \uf313
            case opensuse
                set os_icon \uf314
            case rhel
                set os_icon \uf316
            case sabayon
                set os_icon \uf317
            case slackware
                set os_icon \uf318
            case ubuntu
                set os_icon \uf31b
            case '*'
                set os_icon \uf31a
        end
    else if test -f /etc/lsb-release
        # Linux distribution with an /etc/lsb-release but no /etc/os-release
        set os_name (get_variable NAME /etc/os-release)
        set os_version (get_variable VERSION /etc/os-release)
        set --local os_id (get_variable ID /etc/os-release)
        switch "$os_id"
            case Mageia
                set os_icon \uf310
            case '*'
                set os_icon \uf31a
        end
    else
        # Fall back to uname and no logo if we can't detect anything
        set os_name (uname --kernel-name --kernel-release)
    end

    echo (string join ' ' $os_icon $os_name $os_version)
end
