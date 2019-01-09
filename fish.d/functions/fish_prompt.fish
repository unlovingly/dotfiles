# maybe they're shouldn't be here
set __fish_git_prompt_show_informative_status 'yes'
set __fish_git_prompt_showcolorhints 'yes'

set -g __fish_git_prompt_char_cleanstate "x"
set -g __fish_git_prompt_char_dirtystate "*" "+"
set -g __fish_git_prompt_char_invalidstate "#" "X"
set -g __fish_git_prompt_char_stagedstate "+" "o"
set -g __fish_git_prompt_char_untrackedfiles "%" ".."
set -g __fish_git_prompt_char_upstream_ahead ">" ">>"
set -g __fish_git_prompt_char_upstream_behind "<" "<<"

function fish_prompt
    set -l name (whoami)
    set -l mood " "(fish_prompt_status $status)
    set -l host " at "(set_color yellow)(prompt_hostname)(set_color normal)
    set -l time ", "(date "+%H:%M")
    set -l c_wd " in "(set_color blue)(prompt_pwd)(set_color normal)

    set -l git_info (__fish_git_prompt "on %s")

    set -l statuses "$name$mood$host$time$c_wd"

    set -l prompt (string join "" (fish_default_mode_prompt) "% ")

    fish_prompt_print_line $statuses $git_info
    fish_prompt_print_line $prompt
end

function fish_prompt_status
    if test $argv[1] -eq 0
        echo -n -s (set_color green)":)"(set_color normal)
    else
        echo -n -s (set_color red)":("(set_color normal)
    end
end

function fish_prompt_print_line
    if test (count $argv) -eq 1
        echo -s $argv[1]
    else
        set -l left $argv[1]
        set -l right $argv[2]

        # remove ANSI escape sequences
        set -l visible_text (string replace -ra "(?:\x1b\x28\x42|\x1b\[[0-9;]*[msuJGHK]|\x0f)" "" "$left$right")
        set -l arglength (string length $visible_text)
        set -l padding (string repeat --count (math $COLUMNS - $arglength) " ")

        echo -s "$left$padding$right"
    end
end