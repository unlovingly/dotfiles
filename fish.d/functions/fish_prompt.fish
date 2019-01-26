function fish_prompt
    set -l name (whoami)
    set -l mood " "(fish_prompt_print_status $status)
    set -l host " at "(set_color yellow)(prompt_hostname)(set_color normal)
    set -l time ", "(date "+%H:%M")
    # padding 計算して prompt_cwd に引数与えたい
    set -l c_wd " in "(set_color blue)(prompt_pwd)(set_color normal)

    set -l git_info (__fish_git_prompt "on %s")

    set -l statuses "$name$mood$host$time$c_wd"

    set -l prompt (string join "" (fish_default_mode_prompt) "% ")

    fish_prompt_print_line $statuses $git_info
    fish_prompt_print_line $prompt
end

function fish_prompt_print_line --argument-names left right
    if test (count $argv) -eq 1
        echo -s $left
    else
        set -l arglength (string length (fish_prompt_unescape_sequences "$left$right"))
        set -l padding (string repeat --count (math $COLUMNS - $arglength) " ")

        echo -s "$left$padding$right"
    end
end

function fish_prompt_print_status --argument-names code
    if test $code -eq 0
        echo -n -s (set_color green)":)"(set_color normal)
    else
        echo -n -s (set_color red)":("(set_color normal)
    end
end

function fish_prompt_unescape_sequences --argument-names text
    echo -n -s (string replace -ra "(?:\x1b\x28\x42|\x1b\[[0-9;]*[msuJGHK]|\x0f)" "" $text)
end
