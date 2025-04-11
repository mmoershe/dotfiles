# If not running interactively, dont do anything
[ -z "$PS1" ] && return

# STARSHIP
eval "$(starship init bash)"

# TERMINAL STARTUP
fastfetch -c paleofetch
echo

# ****
# ALIAS
# ****
# alias ls="ls --color=auto"
alias ls="eza"
alias lg="lazygit"
alias vactivate="source venv/bin/activate"
alias grep="grep --color=auto"
alias devrun="clear && npm run dev"

# docker
alias prune="docker system prune -af"
alias compose="docker-compose up"
