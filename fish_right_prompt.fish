function fish_right_prompt \
    --description "Let user override prompt"

    printf "\033[1A%s%s%s\033[1B" $pure_color_right_prompt "$pure_right_prompt" $pure_color_normal
end
