# .zshenv is always sourced, and so should contain exported
# variables that should be available to other programs.

export PATH=~/bin:/sbin:/usr/local/bin:usr/share:/snap/bin:$PATH
export ZSH=$ZDOTDIR/.oh-my-zsh

# Linuxbrew stuff
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
# For compilers to find isl@0.18 you may need to set:
export LDFLAGS="-L/home/linuxbrew/.linuxbrew/opt/isl@0.18/lib"
export CPPFLAGS="-I/home/linuxbrew/.linuxbrew/opt/isl@0.18/include"
# For pkg-config to find isl@0.18 you may need to set:
export PKG_CONFIG_PATH="/home/linuxbrew/.linuxbrew/opt/isl@0.18/lib/pkgconfig"

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
<<<<<<< HEAD
   export EDITOR='gvim'
=======
   export EDITOR='gedit'
>>>>>>> 882637e (install script now installs oh-my-zsh with the --unattended flag using oh-my-zsh's install script. Now the final check at the end of the install script will successfully run the 'omz update' command and inform of a successful install.)
 fi
