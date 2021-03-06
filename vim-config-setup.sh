#
# vim-config-setup.sh
# The intent is to run this right after installing vim or against a vanilla vim install
# @ciph34block
#
if [ -a ~/.vimrc ]
then
    mv ~/.vimrc ~/.vimrc.bak
fi

curl -sL https://raw.githubusercontent.com/egalpin/apt-vim/master/install.sh | sh 
. ~/.bashrc 
apt-vim install -y https://github.com/scrooloose/nerdtree.git 
apt-vim install -y https://github.com/vim-syntastic/syntastic.git 
apt-vim install -y https://github.com/tpope/vim-fugitive.git 
apt-vim install -y https://github.com/ctrlpvim/ctrlp.vim.git 
apt-vim install -y https://github.com/vim-airline/vim-airline.git 
apt-vim install -y https://github.com/ervandew/supertab.git 
apt-vim install -y https://github.com/majutsushi/tagbar.git 
apt-vim install -y https://github.com/bling/vim-bufferline.git

cat >~/.vimrc << EOL
syntax on
filetype on
set number
set ignorecase
set smartcase
set backspace=indent,eol,start
set autoindent
set visualbell
set t_vb=
set mouse=a
set shiftwidth=4
set softtabstop=4
set expandtab
set autoread
set encoding=utf-8
set list
set ttyfast
set nolist

au BufRead,BufNewFile *.asm,*.nasm set filetype=nasm

execute pathogen#infect()
call pathogen#helptags()

" open NERDTree via CTRL-N
map <C-n> :NERDTreeToggle<CR>

" vim opened on directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" close vim if NERDTREE only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" open Ctrl-P via CTRL-P
map <C-p> :CtrlP<CR>

" open TagBar via CTRL-T
map <C-t> :TagbarToggle<CR>
EOL

cat >~/.gvimrc << EOL
colorscheme torte
EOL
