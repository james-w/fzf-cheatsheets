'emulate' 'zsh' '-o' 'no_aliases'

{
    fzf-cheatsheets-widget() {
        local cmd
        cmd=$(echo "${LBUFFER}" | awk '{ print $1 }')
        local query
        query=$(echo "${LBUFFER}" | awk '{for (i=2; i<NF; i++) print $i " "; print $NF}')
        local selected
        if [ -z "${cmd}" ]; then
            selected="$(fzf-cheatsheets --widget)"
        else
            selected="$(fzf-cheatsheets --widget "${cmd}" -- "${query}")"
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
    bindkey '^X^P' fzf-cheatsheets-widget
    bindkey -M viins '^X^P' fzf-cheatsheets-widget
    bindkey -M vicmd '^X^P' fzf-cheatsheets-widget
}
