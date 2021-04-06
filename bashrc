export FZF_DEFAULT_OPTS="--ansi"
export FZF_DEFAULT_COMMAND="fd --type file --color=always --follow --hidden --exclude .git"
export FZF_CTRL_T_COMMAND="${FZF_DEFAULT_COMMAND}"
export FZF_ALT_C_COMMAND="fd --type directory --color=always --follow --hidden --exclude .git"

export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

export FZF_CTRL_R_OPTS="--preview 'echo {}'"
function _update_ps1() {
    PS1="$(powerline-go -error $? -jobs $(jobs -p | wc -l))"

    # Uncomment the following line to automatically clear errors after showing
    # them once. This not only clears the error for powerline-go, but also for
    # everything else you run in that shell. Don't enable this if you're not
    # sure this is what you want.

    #set "?"
}

if [ "$TERM" != "linux" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

