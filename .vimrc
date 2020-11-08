if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" --- PLUGINS --- 

call plug#begin('~/.vim/plugged')

      Plug 'bling/vim-airline'
      Plug 'morhetz/gruvbox'
      Plug 'jiangmiao/auto-pairs'
      Plug 'ap/vim-css-color'

call plug#end()

" --- VIM SETTINGS ---

let g:airline_powerline_fonts = 1
set cursorline
set termguicolors
set encoding=utf-8
set number
set mouse=a
set clipboard+=unnamedplus
set noswapfile
set smarttab
set smartindent
set autoindent
set fileformat=unix
set noshowmode
set bg=dark
colorscheme gruvbox
let g:airline#extensions#whitespace#enabled = 0 
