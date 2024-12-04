bindkey '\t' autosuggest-accept
set -o vi
export DIRENV_LOG_FORMAT="$(printf "\033[2mdirenv: %%s\033[0m")"
export LIBGL_ALWAYS_INDIRECT=0 # to make x server applications working
export MANPAGER='nvim +Man!' # use nvim to view man pages
