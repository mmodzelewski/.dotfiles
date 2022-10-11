# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

DEFAULT_USER=`whoami`

# Android
export ANDROID_HOME=/home/mm/tools/Android/sdk
export ANDROID_SDK_ROOT=/home/mm/tools/Android/sdk
export PATH=$PATH:/home/mm/tools/Android/sdk/platform-tools

# Java
export PATH=$PATH:/home/mm/tools/maven/bin
export PATH=$PATH:/home/mm/.jenv/bin

# Go
export PATH=$PATH:/home/mm/tools/go/bin
export PATH=$PATH:$(go env GOPATH)/bin

# JS
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# Other
export PATH="/home/mm/tools/Sencha/Cmd:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="/home/mm/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="agnoster"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-autosuggestions
  docker
  docker-compose
  volta
  golang
  rust
  gcloud
  sdk
)
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,bold,underline"

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias idea="nohup idea . > /dev/null 2>&1 & disown"
alias idea_run="nohup idea > /dev/null 2>&1 & disown"
alias open='nohup nautilus . > /dev/null 2>&1 & disown'
alias c='xclip -selection clipboard'
alias v='xclip -o'
alias sc-prez='xrandr --size 1920x1080'
alias sc-vid='xrandr --size 2560x1440'
alias sc-4k='xrandr --size 3840x2160'
alias weather='curl wttr.in\?format=v2'
alias android_studio="nohup /home/mm/tools/android-studio/bin/studio.sh > /dev/null 2>&1 & disown"
alias cat="bat"
alias dps='docker ps --format "table {{.ID}}\t{{.Image}}\t{{.Status}}\t{{.Names}}"'
alias dwatch='watch -n 1 "docker ps --format \"table {{.ID}}\t{{.Image}}\t{{.Status}}\t{{.Names}}\""'
[[ ! -f ~/.projects.zsh ]] || source ~/.projects.zsh

jpg_rename() {
	jhead -exonly -n"%Y.%m.%d-%H.%M-$1" *.JPG
}

jpg_rename1() {
	jhead -exonly -n"%Y.%m.%d-%H.%M-$1" *.jpg
}

ch () { curl -s cheat.sh/$1 | less }

idea_edit () {
	nohup idea -e $1 > /dev/null 2>&1 & disown
}

idea_open () {
	nohup idea $1 > /dev/null 2>&1 & disown
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source /usr/share/doc/fzf/examples/key-bindings.zsh

bindkey -s ^f " tmux-sessionizer\n"

eval "$(jenv init -)"

