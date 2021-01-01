" @file   $VIMCONFIG/vimrc
" @author bhgomes

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
set nocompatible
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SESSION/VIEW OPTIONS

set sessionoptions -=options
set viewoptions    -=options

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLOR

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^Eterm'
  set t_Co=16
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIMINFO

if !empty(&viminfo)
  set viminfo^=!
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TAGS

if has('path_extra')
  setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LISTCHARS

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COMMENTING

if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j " Delete comment character when joining commented lines
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SAVE CURSOR

autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

autocmd BufReadPost * silent! normal! g`"zv

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PERSISTENT UNDO
" FIXME
" if has('persistent_undo')
"     let undodirpath =$SHARE/vim/undodir
"     call system('mkdir -p' . undodirpath)
"     let &undodir = undodirpath
"     set undofile
" endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" KEY-BINDINGS

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
nmap     <C-a> I
imap     <C-a> <esc>I
nmap     <C-e> A
imap     <C-e> <esc>A
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" GLOBAL COPY-PASTE
" TODO vnoremap <C-c> "*y :let @+=@*<CR>
vnoremap <C-c> "+y
map <C-p> "+P

" WINDOWS
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FILETYPE PLUGIN-INDENT

if has('autocmd')
  filetype plugin indent on
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SYNTAX

if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" REMOVE GUI CURSOR

autocmd OptionSet guicursor noautocmd set guicursor=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NETRW

let g:netrw_dirhistmax = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGPAC
" https://github.com/bennyyip/plugpac.vim

call plugpac#begin() " --------------------------------------------------------

" BASICS
Pack 'tpope/vim-repeat'
Pack 'tpope/vim-surround'
Pack 'tpope/vim-commentary'
Pack 'tpope/vim-scriptease'
Pack 'tpope/vim-unimpaired'
Pack 'godlygeek/tabular'
Pack 'terryma/vim-multiple-cursors'
Pack 'justinmk/vim-sneak'
Pack 'easymotion/vim-easymotion'
Pack 'chrisbra/unicode.vim'

" TERM 
Pack 'wincent/terminus'

" VERSION CONTROL
Pack 'tpope/vim-fugitive'
Pack 'airblade/vim-gitgutter'
Pack 'jreybert/vimagit'

" LANGUAGE
Pack 'neoclide/coc.nvim'
Pack 'dense-analysis/ale'
Pack 'sheerun/vim-polyglot'
Pack 'rust-lang/rust.vim'
Pack 'kdheepak/JuliaFormatter.vim'

" FZF 
Pack 'junegunn/fzf'

" COLORSCHEME 
Pack 'flazz/vim-colorschemes'
Pack 'chriskempson/base16-vim'

" ICONS
Pack 'ryanoasis/vim-devicons'

" LIGHTLINE
Pack 'itchyny/lightline.vim'

" ORGANIZATION :disabled:
" Pack 'itchyny/calendar.vim'
" Pack 'dhruvasagar/vim-dotoo'
" Pack 'dhruvasagar/vim-table-mode'
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

" OTHER
Pack 'ryanoasis/vim-devicons'
Pack 'rrethy/vim-hexokinase'

call plugpac#end() " ----------------------------------------------------------

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SETUP matchit

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SETUP coc

let g:coc_disable_startup_warning = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SETUP lightline

let g:lightline = {
    \ 'colorscheme': 'powerline',
    \ 'active': {
    \   'left':  [ [ 'mode',      'paste'                            ],
    \              [ 'gitbranch', 'readonly', 'filename', 'modified' ], ],
    \   'right': [ [ 'lineinfo'                                      ],
    \              [ 'percent'                                       ], ],
    \ },
    \ 'component_function': {
    \   'gitbranch': 'FugitiveHead',
    \ },
    \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SETUP FZF

nnoremap <silent> <leader>f :FZF<cr>

" TODO set rtp+=/usr/local/opt/fzf

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SETUP ZEN

let g:goyo_width         = 80
let g:goyo_margin_top    = 2
let g:goyo_margin_bottom = 2

nnoremap <silent> <leader>z :Goyo<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SETUP gitgutter

let g:gitgutter_enabled=0
nnoremap <silent> <leader>gd :GitGutterToggle<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SETUP nerdtree

let g:NERDTreeWinPos   = "right"
let NERDTreeShowHidden = 1
let g:NERDTreeWinSize  = 35

map <leader>nt :NERDTreeToggle<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SETUP Rust

let g:rustfmt_autosave = 1

command! CargoPlay !cargo play %

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SETUP JuliaFormatter

let g:JuliaFormatter_options = {
    \ 'indent'                    : 4,
    \ 'margin'                    : 92,
    \ 'always_for_in'             : v:false,
    \ 'whitespace_typedefs'       : v:false,
    \ 'whitespace_ops_in_indices' : v:true,
    \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SETUP lf

" TODO
" function! LF()
"     let temp = tempname()
"     exec 'silent !lf -selection-path=' . shellescape(temp)
"     if !filereadable(temp)
"         redraw!
"         return
"     endif
"     let names = readfile(temp)
"     if empty(names)
"         redraw!
"         return
"     endif
"     exec 'edit ' . fnameescape(names[0])
"     for name in names[1:]
"         exec 'argadd ' . fnameescape(name)
"     endfor
"     redraw!
" endfunction

" command! -bar LF call LF()

" nnoremap <leader>lf :LF<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SET COLORSCHEME

autocmd vimenter * colorscheme base16-black-metal

