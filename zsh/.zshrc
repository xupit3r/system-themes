# my default PATH
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$HOME/code/joenix/utils/:$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# terminal truecolor
set -g default-terminal "screen-256color"
zmodload zsh/nearcolor

# kitty kitty kitty cat! meeeeoooow!
TERM=xterm-kitty

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker lein node npm python pip ag ripgrep fzf)

# load oh-my-zsh (and don't use any omz themes)
ZSH_THEME=""
source $ZSH/oh-my-zsh.sh

# setup Pure theme (https://github.com/sindresorhus/pure#getting-started)

autoload -U promptinit; promptinit

# optionally define some options
PURE_CMD_MAX_EXEC_TIME=10

# change the path color
zstyle :prompt:pure:path color '#ff6ac1'

# change the color for both `prompt:success` and `prompt:error`
zstyle :prompt:pure:prompt:success color '#5af78e'
zstyle :prompt:pure:prompt:error color '#ff5c57'


# turn on git stash status
zstyle :prompt:pure:git:stash show yes

# load the pure prompt
prompt pure

# make sure we are using the LTS release of node, by default
source /usr/share/nvm/init-nvm.sh
nvm use --lts > /dev/null

# some completions stuffs...
eval "$(op completion zsh)"; compdef _op op

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nano'
 else
   export EDITOR='nvim'
 fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# use most as our pager
export PAGER="most"

# some useful aliases
alias remove-orphans="sudo pacman -Qtdq | sudo pacman -Rns -"
alias open="xdg-open"
alias battery="acpi -b"
alias syu="systemctl --user"
alias icat="kitty +kitten icat"
alias list-fonts="fc-list : family | sort | uniq"

# integrate ripgrep into fzf
export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!.git'"

# fzf base install
export FZF_BASE=/usr/share/fzf

# babashka repl stuffs
export BB_REPL_PORT=5678
alias brepl="bb --nrepl-server $BB_REPL_PORT"

# babashka tasks autocomplete
_bb_tasks() {
    local matches=(`bb tasks |tail -n +3 |cut -f1 -d ' '`)
    compadd -a matches
    _files # autocomplete filenames as well
}
compdef _bb_tasks bb

# a bunch of perl stuffs....
PATH="/home/joe/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/joe/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/joe/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/joe/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/joe/perl5"; export PERL_MM_OPT;

export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock

# have to add the stupid fucking snap shit...
PATH=$PATH:/var/lib/snapd/snap/bin

# prompt syntax highlighting!
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
