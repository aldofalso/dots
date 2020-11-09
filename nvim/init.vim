
if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall 
endif

" --- PLUGINS --- 

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))

      Plug 'bling/vim-airline'
      Plug 'morhetz/gruvbox'
      Plug 'jiangmiao/auto-pairs'
      Plug 'ap/vim-css-color'

call plug#end()

" --- VIM SETTINGS ---

let g:airline_powerline_fonts = 1
set guicursor+=a:blinkon1
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
colorscheme gruvbox
let g:airline#extensions#whitespace#enabled = 0 
