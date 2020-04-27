__fcheat() {
}

fzf-cheatsheets-widget() {
    local cmd
    cmd=$(echo "${LBUFFER}" | awk '{ print $1 }')
    local query
    query=$(echo "${LBUFFER}" | awk '{for (i=2; i<NF; i++) print $i " "; print $NF}')
    local selected
    if [ -z "${cmd}" ]; then
      selected="$(command fzf-cheatsheets)"
    else
      selected="$(command fzf-cheatsheets "${cmd}" -- "${query}")"
    fi
    local ret=$?
    if [ $ret -eq 0 ]; then
        LBUFFER="$selected"
    else
        echo "$selected" 1>&2
    fi
    zle reset-prompt
    return $ret
}

zle -N fzf-cheatsheets-widget
bindkey '\ec' fzf-cheatsheets-widget
