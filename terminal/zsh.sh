start_session() {
    zle -I # Clear the zle prompt to avoid display issues
    tmux has-session &>/dev/null && ~/.local/bin/session-starter/session-starter.sh
}
zle -N start_session
set -o vi
bindkey '^F' start_session

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}


export DIRENV_LOG_FORMAT="$(printf "\033[2mdirenv: %%s\033[0m")"
export LIBGL_ALWAYS_INDIRECT=0 # to make x server applications working
export MANPAGER='nvim +Man!' # use nvim to view man pages
export EDITOR='nvim'

alias s="home-manager switch --flake ~/wsl-home --impure"
alias c="clear"
alias vi="nvim"
alias vim="nvim"
alias lg="lazygit"
alias e="explorer.exe ."
alias ls="eza"
alias cat="bat"

alias gcl="git clone"
