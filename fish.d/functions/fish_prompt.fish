function fish_prompt
    set -l exit_code $status
    set -l git_info (fish_prompt_git)
    set -l vi_mode (fish_prompt_vi_mode)

    set -l name (whoami)
    set -l mood " "(fish_prompt_status $exit_code)
    set -l location " at "(set_color yellow)(prompt_hostname)(set_color $fish_color_normal)
    set -l cwd " in "(set_color blue)(prompt_pwd)(set_color $fish_color_normal)

    set -l basic_prompt $name$mood$location$cwd

    set -l prompt $vi_mode" % "

    fish_prompt_print_first_line $basic_prompt $git_info

    echo -n -s $prompt
end

function fish_prompt_status
    if test $argv[1] -eq 0
        echo (set_color green)":)"(set_color $fish_color_normal)
    else
        echo (set_color red)":("(set_color $fish_color_normal)
    end
end

function fish_prompt_git
    if test (command git rev-parse --is-inside-work-tree ^/dev/null)
        set -l result
        set -l git_branch_name (git symbolic-ref --short HEAD)

        set result "on "(set_color white)"$git_branch_name"

        if test (command git status -s --ignore-submodules=dirty | wc -l) -gt 0
            set result "$result"(set_color yellow)"*"
        end

        echo "$result"(set_color $fish_color_normal)
    end
end

function fish_prompt_print_first_line
    if test (count $argv) -eq 1
        echo -s $argv
    else
        set -l left $argv[1]
        set -l right $argv[2]

        # remove ANSI color
        set -l arglength (string length (string replace -ra "\x1b.*?[mGKH]" "" "$left$right"))
        set -l padding (string repeat --count (math $COLUMNS - $arglength) " ")

        if test $arglength -lt $COLUMNS
            # I don't know the reason why `set_color $fish_color_normal` counted as the character
            set padding $padding(string repeat --count 4 " ")
        end

        echo -s "$left$padding$right"
    end
end

function fish_prompt_vi_mode
    switch $fish_bind_mode
        case default
            echo "[n]"
        case insert
            echo "[i]"
        case visual
            echo "[v]"
        case replace_one
            echo "[r]"
    end
end