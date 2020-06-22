# .vim [![CC0](http://mirrors.creativecommons.org/presskit/buttons/88x31/svg/cc-zero.svg)](https://creativecommons.org/publicdomain/zero/1.0/)
_modal is better_

## Installation

### With Neovim

Place the following in the `$HOME/.config/nvim/init.vim` configuration:

```vim
set runtimepath^=$VIMCONFIG
set runtimepath+=$VIMCONFIG/after

let &packpath = &runtimepath

source $VIMRC
```

### Packages

Run `git submodule init` and `git submodule update --recursive` to download `minpac`. Then, open `vim` and run `:PlugInstall` to download all the plugins.

```sh
git submodule init
git submodule update --recursive
vim -c PackInstall
```

