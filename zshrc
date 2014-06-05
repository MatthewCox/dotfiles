# Path to your oh-my-zsh configuration.
ZSH=$REALHOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster-tyranicmoron"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git screen extract cp history history-substring-search virtualenv virtualenvwrapper zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

eval `dircolors -b $DIRCOLORS`

source $REALHOME/.zsh_aliases

source $REALHOME/.zsh_keybinds

export HISTFILE=$REALHOME/.zsh_history_$USER

ZSH_HIGHLIGHT_STYLES[alias]='fg=048'                            # light turquoise
ZSH_HIGHLIGHT_STYLES[builtin]='fg=028'                          # green
ZSH_HIGHLIGHT_STYLES[function]='fg=154'                         # yellowy green
ZSH_HIGHLIGHT_STYLES[command]='fg=010'                          # lime green
ZSH_HIGHLIGHT_STYLES[precommand]='fg=010,bold'                  # lime green
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=201'                 # hot pink - pipes and stuff
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=201'                   # hot pink (dunno what this is)
ZSH_HIGHLIGHT_STYLES[path]='fg=011,bold'                        # yellow
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=178,bold'                 # dark yellow, incomplete (but valid so far) path
ZSH_HIGHLIGHT_STYLES[path_approx]='fg=178,bold,standout'        # path possibly contains mistyped letters, zsh will suggest a correction
ZSH_HIGHLIGHT_STYLES[globbing]='fg=075'                         # azure
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=075'                # azure
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='none'               
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='none'               
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='none'               
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=208'           # orange
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=208'           # orange
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=014'    # cyan
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=208,standout'      # orange - escaped chars
ZSH_HIGHLIGHT_STYLES[assign]='none'                             # variable assignment

export SKIPZSH=1

fortune | cowsay
