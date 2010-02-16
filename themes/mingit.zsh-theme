function prompt_char {
    # git branch >/dev/null 2>/dev/null && echo '±' && return
    # # hg root >/dev/null 2>/dev/null && echo '☿' && return
    # echo '○'
    echo '$'
}

function battery_charge {
    echo `$BAT_CHARGE` 2>/dev/null
}

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

function my_git_info () {
    ref=$(git_prompt_info) || return
    echo "git:$ref"
}

# PROMPT='
# %{$fg[magenta]%}%n%{$reset_color%} at %{$fg[yellow]%}%m%{$reset_color%} in %{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%}$(git_prompt_info)
# $(virtualenv_info)$(prompt_char) '
PROMPT='[$(my_git_info)${PWD/#$HOME/~}]$(prompt_char) '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[red]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

if [[ $EMACS = t ]] then
    ZSH_THEME_GIT_PROMPT_PREFIX=""
    ZSH_THEME_GIT_PROMPT_SUFFIX=" "
    ZSH_THEME_GIT_PROMPT_DIRTY="!"
    ZSH_THEME_GIT_PROMPT_UNTRACKED="?"
fi
