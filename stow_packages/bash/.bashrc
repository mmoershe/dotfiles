eval "$(starship init bash)"

# TERMINAL STARTUP (only in interactive shells)
if [[ $- == *i* ]]; then
    echo
    fastfetch -c paleofetch --logo arch2
    echo
fi

alias lg="lazygit"
alias ls="eza"
alias vactivate="source venv/bin/activate"
