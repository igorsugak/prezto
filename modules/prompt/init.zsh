#
# Loads prompt themes.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Load and execute the prompt theming system.
autoload -Uz promptinit && promptinit

# Load the prompt theme.
zstyle -a ':prezto:module:prompt' theme 'prompt_argv'
if [[ "$TERM" == (dumb|linux|*bsd*) ]] || (( $#prompt_argv < 1 )); then
  prompt 'off'
else
  prompt "$prompt_argv[@]"
fi
unset prompt_argv

_errorcode_prompt() {
    local stat="$?"
    local E=$(printf '\e')
    local red="${E}[31;1m"
    local no_color="${E}[0;0m"
    if test "$stat" -ne 0; then
        # If process exited by a signal, determine name of signal.
        if test "$stat" -gt 128; then
            local signal="$(builtin kill -l $[$stat - 128] 2>/dev/null)"
            if test "$signal"; then
                signal=" ($signal)"
            fi
        fi
        echo "[${red}Exit $stat$signal${no_color}]" 1>&2
    fi
}
precmd_functions+=(_errorcode_prompt)
