# https://gist.github.com/yoshikaw/4437957
zmodload zsh/parameter

function zaw-src-z() {
    local reverse_cmd='tac'
    [ -n "${(MS)OSTYPE#darwin}" ] && reverse_cmd='tail -r'

    # see http://stackoverflow.com/questions/452290/ for IFS trick
    IFS=$(echo -n -e '\0')
    : ${(A)candidates::=$(_z 2>&1 \
        | sed -e 's/^[0-9\\. ]*//' -e 's/ /\\ /g' -e "s#^$HOME#~#" \
        | ${(z)reverse_cmd} | tr '\n' '\0')}
    unset IFS
    actions=("zaw-callback-execute" "zaw-callback-replace-buffer" "zaw-callback-append-to-buffer")
    act_descriptions=("execute" "replace edit buffer" "append to edit buffer")
}

zaw-register-src -n z zaw-src-z
