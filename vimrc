" @file   $VIMCONFIG/vimrc
" @author bhgomes

" SETTINGS
set autoindent
set autoread
set expandtab
set hidden
set hlsearch
set incsearch
set ignorecase
set lazyredraw
set linebreak
set magic
set nolist
set noshowmode
set number
set relativenumber
set ruler
set showmatch
set smartcase
set smarttab
set termguicolors
set wildmenu
set wrap
set backspace      =indent,eol,start
set cmdheight      =1
set complete      -=i
set display       +=lastline
set encoding       =utf8
set history        =1000
set laststatus     =2
set nrformats     -=octal
set scrolloff      =1
set shiftwidth     =4
set sidescrolloff  =5
set softtabstop    =0
set tabpagemax     =50
set tabstop        =4
set updatetime     =300


" SESSION/VIEW OPTIONS
set sessionoptions -=options
set viewoptions    -=options


" COLOR
" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^Eterm'
  set t_Co=16
endif


" VIMINFO
if !empty(&viminfo)
  set viminfo^=!
endif


" ENCODING
if &encoding ==# 'latin1' && has('gui_running')
  set encoding=utf-8
endif


" TAGS
if has('path_extra')
  setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif


" LISTCHARS
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif


" COMMENTING
if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j " Delete comment character when joining commented lines
endif


" LEADER <space>
let mapleader = " "


" FAST SAVE-EXIT
nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>
nmap <leader>x :x<cr>


" KEYBIND
if empty(mapcheck('<C-U>', 'i'))
  inoremap <C-U> <C-G>u<C-U>
endif
if empty(mapcheck('<C-W>', 'i'))
  inoremap <C-W> <C-G>u<C-W>
endif


" EMACS FRONT-BACK
nmap <C-a> I
imap <C-a> <ESC>I
nmap <C-e> A
imap <C-e> <ESC>A


" GLOBAL COPY-PASTE
" TODO vnoremap <C-c> "*y :let @+=@*<CR>
vnoremap <C-c> "+y
map <C-p> "+P


" WINDOWS
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l


" FILETYPE PLUGIN-INDENT
if has('autocmd')
  filetype plugin indent on
endif


" SYNTAX
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif


" NETRW
let g:netrw_dirhistmax = 0


" PLUGPAC
" https://github.com/bennyyip/plugpac.vim
call plugpac#begin() " -------------------------------------------------------

" BASICS
Pack 'tpope/vim-surround'
Pack 'tpope/vim-commentary'
Pack 'tpope/vim-scriptease'

" TERM 
Pack 'wincent/terminus'

" VERSION CONTROL
Pack 'tpope/vim-fugitive'
Pack 'airblade/vim-gitgutter'
Pack 'jreybert/vimagit'

" COMPLETION
Pack 'neoclide/coc.nvim', {'branch': 'release'}

" LANGUAGE
Pack 'sheerun/vim-polyglot'
Pack 'rust-lang/rust.vim'

" FZF 
Pack 'junegunn/fzf'

" COLORSCHEME 
Pack 'Roy-Orbison/nord-vim-256'
Pack 'chriskempson/base16-vim'
Pack 'jnurmine/Zenburn'
Pack 'smallwat3r/vim-efficient'
Pack 'smallwat3r/vim-simplicity'
Pack 'zefei/simple-dark'

" LIGHTLINE
Pack 'itchyny/lightline.vim'

" ORGANIZATION :disabled:
" Pack 'dhruvasagar/vim-dotoo'
" Pack 'jceb/vim-orgmode'

" MARKDOWN
Pack 'mmai/vim-markdown-wiki'

" EDITORCONFIG
Pack 'editorconfig/editorconfig-vim'

" NERDTREE
Pack 'preservim/nerdtree'

" ZEN
Pack 'junegunn/goyo.vim'
Pack 'amix/vim-zenroom2'

call plugpac#end() " ---------------------------------------------------------


" SETUP matchit
" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif


" SETUP lightline
let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }


" SETUP goyo
nnoremap <silent> <leader>z :Goyo<cr>

" AUTOCMD
autocmd vimenter * colorscheme base16-black-metal

