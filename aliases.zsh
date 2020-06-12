#!/usr/bin/env zsh
#
# @file   $VIMCONFIG/aliases.zsh
# @author bhgomes

# VIM
export DEFAULT_VIM_ARGS="-u $VIMCONFIG/vimrc -i $SHARE/vim/.viminfo"
alias vi="vi $DEFAULT_VIM_ARGS"
alias vim="vim $DEFAULT_VIM_ARGS"

# NVIM
alias nv="nvim"

# DEFAULT VIM
alias v="nvim"

# MAGIT
alias magit="v -c MagitOnly"

