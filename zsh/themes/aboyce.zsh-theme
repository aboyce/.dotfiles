symbol_arrow() {
  echo "\u276f" 
}

symbol_dot() {
  echo "\u25cf"
}

current_directory() {
  echo "%0~"
}

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$FG[002]%}$(symbol_dot)%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$FG[001]%}$(symbol_dot)%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_ADDED="a"
ZSH_THEME_GIT_PROMPT_AHEAD=""
ZSH_THEME_GIT_PROMPT_BEHIND=""
ZSH_THEME_GIT_PROMPT_DELETED="d"
ZSH_THEME_GIT_PROMPT_DIVERGED=""
ZSH_THEME_GIT_PROMPT_MODIFIED="m"
ZSH_THEME_GIT_PROMPT_RENAMED="r"
ZSH_THEME_GIT_PROMPT_STASHED="s"
ZSH_THEME_GIT_PROMPT_UNMERGED=""
ZSH_THEME_GIT_PROMPT_UNTRACKED="u"

PROMPT='
%{$FG[240]%}$(current_directory)%{$reset_color%}
$(symbol_arrow) '
RPROMPT='%B$(git_prompt_info)%b $(git_prompt_status)'