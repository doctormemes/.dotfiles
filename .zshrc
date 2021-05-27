# $ZDOTDIR/.zshrc

# P10K instant prompt. Keep close to top of .zshrc. Code that may require console input
# password prompts, etc. must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-~/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
	source "${XDG_CACHE_HOME:-~/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# if there's a $ZDOTDIR directory, oh-my-zsh is probably in it
if [[ -n $ZDOTDIR ]]; then
	export ZSH=$ZDOTDIR/.oh-my-zsh
else # oh-my-zsh is probably in home directory
	export ZDOTDIR=~
	export ZSH=~/.oh-my-zsh
fi

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
else
   export EDITOR='gedit'
fi

# Hyphen-insensitive completion
HYPHEN_INSENSITIVE="true"
# Case-insensitive completion
CASE_SENSITIVE="false"
# Set command history file location and name with below variable.
HISTFILE=$ZDOTDIR/.zsh_history
# You can set one of the optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# see 'man strftime' for details.
HIST_STAMPS="mm/dd/yyyy"
# disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"
# display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="false"
ENABLE_CORRECTION="true"
# change this to false to turn off the help message and neofetch on terminal startup
STARTUP_CONTENT="false"

# Oh-my-zsh enabled plugins
plugins=(
add-to-omz alias-finder
colored-man-pages colorize
common-aliases conda-zsh-completion
cp docker extract fzf
git git-escape-magic
gitignore jump man nordvpn p10k-promptconfig
pip postgres python
sudo thefuck vscode
zsh-autosuggestions
zsh-syntax-highlighting
zsh_reload)

# make less more friendly for non-text input files, see lesspipe(1)
[[ -x /usr/bin/lesspipe ]] && eval "$(SHELL=/bin/sh lesspipe)"

# P10K is only theme
ZSH_THEME="powerlevel10k/powerlevel10k"
# To customize prompt, run `p10k configure`, edit $ZDOTDIR/.p10k.zsh or set P10K_PROMPT below to a prompt file name in P10K-themes directory.
# For example, below I've set my prompt as "docstheme". The actual file name is .docstheme.zsh. Ensure you follow the same format.
P10K_PROMPT="docstheme"

source $ZSH/oh-my-zsh.sh

[[ -f $ZDOTDIR/.conda_init.zsh ]] && source $ZDOTDIR/.conda_init.zsh

# custom aliases
[[ -f $ZDOTDIR/aliases ]] && . $ZDOTDIR/aliases

# custom functions
[[ -f $ZDOTDIR/functions ]] && . $ZDOTDIR/functions

# Deduplicates path & fpath
[[ -f $ZDOTDIR/.zshenv ]] && {
	dedup_pathvar PATH
	dedup_pathvar FPATH
}

# Terminal startup output (won't run unless $STARTUP_CONTENT is true)
[[ -o interactive && -f $ZDOTDIR/functions ]] && {
    [[ "$STARTUP_CONTENT" = "true" ]] && sinfo || neofetch
}

