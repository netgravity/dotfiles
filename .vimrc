##################

set number
set incsearch
set hlsearch
set list
set listchars=tab:\ \ ,eol:$,trail:⋅
set tabstop=2 shiftwidth=2 expandtab
set background=dark
" colorscheme molokai
set backspace=indent,eol,start
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set nocompatible              " be iMproved, required vundle
filetype off                  " required vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required

Plugin 'VundleVim/Vundle.vim'
Plugin 'tomasr/molokai'
Plugin 'tmhedberg/SimpylFold' " for python folding
Plugin 'vim-scripts/indentpython.vim' " for python indentation
Plugin 'davidhalter/jedi-vim'
" Plugin 'valloric/youcompleteme'
Plugin 'vim-syntastic/syntastic' " python syntax checking on each save
Plugin 'nvie/vim-flake8' " check pep8 standards
Plugin 'w0rp/ale'
Plugin 'jnurmine/Zenburn' " colorscheme
Plugin 'altercation/vim-colors-solarized' "colorscheme
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'} " status bar files edited, git branch, virtualenv
Plugin 'vimwiki'
Plugin 'Yggdroot/indentLine' " https://www.arthurkoziel.com/setting-up-vim-for-yaml/ , indent for yaml
Plugin 'chrisbra/unicode.vim' " for any unicode character--> insert mode, c-v,  :SearchUnicode
Plugin 'bluz71/vim-nightfly-guicolors'

call vundle#end()            " required
filetype plugin indent on    " required

" Vimscript initialization file
colorscheme nightfly

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za
"Mappings
let mapleader = ","
:map <C-n> :NERDTree

" Vim Wiki
let g:vimwiki_list = [{'path': '~/Sync/wiki/', 'syntax': 'markdown'}]
au FileType vimwiki setlocal shiftwidth=6 tabstop=6 noexpandtab

" PEP8 indentation standards
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unixi


"""" Ale settings

" Check Python files with flake8 and pylint.
let g:ale_linters = {'python': ['flake8', 'pylint']}
" Fix Python files with autopep8 and yapf.
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['autopep8', 'black']
\}

let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '✘'
" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1

""""" end Ale Settings
""" start yaml settings

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
"let g:indentLine_char = '|'


""" end yaml settings

" for full stack indentation
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

" flagging extra whitespace
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

set encoding=utf-8
let python_highlight_all=1
syntax on

set t_Co=256 " required for zenburn color mode
" set colorscheme based on mode
if has('gui_running')
	  set background=light
	  colorscheme solarized
else
	  colorscheme zenburn
	  set background=dark
 endif


colorscheme nightfly
let g:lightline = { 'colorscheme': 'nightfly' }
" Vimscript initialization file
let g:moonflyIgnoreDefaultColors = 1

call togglebg#map("<F5>")
