set number
set incsearch
set hlsearch
set list
set background=dark
" colorscheme molokai
set backspace=indent,eol,start

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

Plugin 'jnurmine/Zenburn' " colorscheme
Plugin 'altercation/vim-colors-solarized' "colorscheme
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'  " vim integration
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'} " status bar files edited, git branch, virtualenv
Plugin 'vimwiki'

call vundle#end()            " required
filetype plugin indent on    " required

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

" set colorscheme based on mode
if has('gui_running')
	  set background=dark
	    colorscheme solarized
    else
	      colorscheme zenburn
      endif

call togglebg#map("<F5>")

