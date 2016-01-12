# If not running interactively, don't do anything
# 

[ -z "$PS1" ] && return

# Shell

if [ -n "$ZSH_VERSION" ]; then
   SHELL_ZSH=true
   SHELL_BASH=false
elif [ -n "$BASH_VERSION" ]; then
   SHELL_BASH=true
   SHELL_ZSH=false
fi

# OS

if [ "$(uname -s)" = "Darwin" ]; then
    OS="OSX"
else
    OS=$(uname -s)
fi

# Resolve DOTFILES_DIR (assuming ~/.dotfiles on distros without readlink and/or $BASH_SOURCE/$0)

READLINK=$(which greadlink || which readlink)

if $SHELL_BASH; then
    CURRENT_SCRIPT=$BASH_SOURCE
else
    CURRENT_SCRIPT=$0
fi

if [[ -n $CURRENT_SCRIPT && -x "$READLINK" ]]; then
    SCRIPT_PATH=$($READLINK -n "$CURRENT_SCRIPT")
    DOTFILES_DIR=$(dirname "$(dirname "$SCRIPT_PATH")")
elif [ -d "$HOME/.dotfiles" ]; then
    DOTFILES_DIR="$HOME/.dotfiles"
else
    echo "Unable to find dotfiles, exiting."
    return # `exit 1` would quit the shell itself
fi

# Finally we can source the dotfiles (order matters)

for DOTFILE in "$DOTFILES_DIR"/system/.{function,function*,path,env,alias,completion,grep,prompt,custom}; do
    [ -f "$DOTFILE" ] && . "$DOTFILE"
done

if [ "$OS" = "OSX" ]; then
    for DOTFILE in "$DOTFILES_DIR"/system/.{env,alias,function}.osx; do
        [ -f "$DOTFILE" ] && . "$DOTFILE"
    done
fi

if $SHELL_BASH; then
    for DOTFILE in "$DOTFILES_DIR"/system/.*.bash; do
        [ -f "$DOTFILE" ] && . "$DOTFILE"
    done
fi

# git autocomplete
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

# Clean up

unset READLINK CURRENT_SCRIPT SCRIPT_PATH DOTFILE

# Export

export SHELL_BASH SHELL_ZSH OS DOTFILES_DIR

# Vim
cp $DOTFILES_DIR/vim/vimrc ~/.vimrc

# Source aditional functions
source $DOTFILES_DIR/terminal/colors.sh

terminal_set_foreground_color SuperGray
terminal_set_background_color white
terminal_set_font "Monaco" 14
