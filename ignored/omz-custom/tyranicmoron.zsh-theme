function my_git_prompt() {
  tester=$(git rev-parse --git-dir 2> /dev/null) || return

  INDEX=$(git status --porcelain 2> /dev/null)
  STATUS=""

  # is branch ahead?
  if $(echo "$(git log origin/$(current_branch)..HEAD 2> /dev/null)" | grep '^commit' &> /dev/null); then
    STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_AHEAD"
  fi

  # is anything staged?
  if $(echo "$INDEX" | grep -E -e '^(D[ M]|[MARC][ MD]) ' &> /dev/null); then
    STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_STAGED"
  fi

  # is anything unstaged?
  if $(echo "$INDEX" | grep -E -e '^[ MARC][MD] ' &> /dev/null); then
    STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_UNSTAGED"
  fi

  # is anything untracked?
  if $(echo "$INDEX" | grep '^?? ' &> /dev/null); then
    STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_UNTRACKED"
  fi

  # is anything unmerged?
  if $(echo "$INDEX" | grep -E -e '^(A[AU]|D[DU]|U[ADU]) ' &> /dev/null); then
    STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_UNMERGED"
  fi

  if [[ -n $STATUS ]]; then
    STATUS=" $STATUS"
  fi

  echo "$ZSH_THEME_GIT_PROMPT_PREFIX$(my_current_branch)$STATUS$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

function my_current_branch() {
  echo $(current_branch || echo "(no branch)")
}

function ssh_connection() {
  if [[ -n $SSH_CONNECTION ]]; then
    echo "%{$fg_bold[red]%}(ssh) "
  fi
}

function prompt_char() {
  echo "\$"
}

autoload -Uz vcs_info

zstyle ':vcs_info:*' stagedstr '%F{green}●'
zstyle ':vcs_info:*' unstagedstr '%F{yellow}●'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{11}%r'
zstyle ':vcs_info:*' enable p4

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo `basename $VIRTUAL_ENV`
}

theme_precmd() {
  zstyle ':vcs_info:*' formats ' %B%F{green}[%b%c%u%B%F{green}]'
  vcs_info
}

local ret_status="%(?:%{$fg_bold[green]%}:%{$fg_bold[red]%})%?%{$FX[reset]%}"
PROMPT=$'\n$(ssh_connection)%{$fg_bold[green]%}%n@%m%{$FX[reset]%}$(my_git_prompt)${vcs_info_msg_0_}%{$FX[reset]%}$(virtualenv_info) : %~\n[${ret_status}] %(!.#.$) '
RPROMPT='%{$FG[040]%}%D{%y}%{$FG[034]%}%D{%m}%{$FG[028]%}%D{%d} %{$FG[081]%}%D{%H}%{$FG[075]%}%D{%M}%{$FG[069]%}%D{%S}%{$FX[reset]%}'

ZSH_THEME_PROMPT_RETURNCODE_PREFIX="%{$fg_bold[red]%}"
ZSH_THEME_GIT_PROMPT_PREFIX=" $fg_bold[white]‹ %{$fg_bold[yellow]%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg_bold[magenta]%}↑"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg_bold[green]%}●"
ZSH_THEME_GIT_PROMPT_UNSTAGED="%{$fg_bold[red]%}●"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[white]%}●"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg_bold[red]%}✕"
ZSH_THEME_GIT_PROMPT_SUFFIX=" $fg_bold[white]›%{$reset_color%}"

autoload -U add-zsh-hook
add-zsh-hook precmd theme_precmd
