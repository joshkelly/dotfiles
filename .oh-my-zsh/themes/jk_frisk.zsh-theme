PROMPT=$'
%{$fg[blue]%}%3~%{$reset_color%} $(git_prompt_info)$(bzr_prompt_info)%{$fg[green]%}[%n@%m]%{$reset_color%} %{$fg[white]%}[%T]%{$reset_color%}
%{$fg_bold[black]%}>%{$reset_color%} '

PROMPT2="%{$fg_blod[black]%}%_> %{$reset_color%}"

GIT_CB="git::"
ZSH_THEME_SCM_PROMPT_PREFIX="%{$fg[yellow]%}["
ZSH_THEME_GIT_PROMPT_PREFIX=$ZSH_THEME_SCM_PROMPT_PREFIX$GIT_CB
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}*%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
