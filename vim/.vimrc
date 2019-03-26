set clipboard=unnamedplus
set number
set cursorline
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Yggdroot/indentLine' " For displaying indentation levels (code blocks)
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'pangloss/vim-javascript'
call vundle#end()
filetype plugin indent on

" Enable syntax highlighting for JSDocs
let g:javascript_plugin_jsdoc = 1

" Enable code folding. Should disable in case of performance degradation.
augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END

" Use 2 spaces as tab
filetype plugin indent on
" On pressing tab, insert 2 spaces
set expandtab
set tabstop=2
" When indenting with '>', use 2 spaces width
set shiftwidth=2
" Delete key deletes characters in insert mode, goes backwards in normal mode
set backspace=indent,eol,start

" Show | for indentation levels
let g:indentLine_char = '|'

" solarized
syntax enable
set background=light
highlight Normal ctermbg=NONE
let g:solarized_termcolors=256
colorscheme solarized

" airline
let g:airline#extensions#branch = 1
let g:airline#extensions#syntastic = 1
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_solarized_bg='light'

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_right_sep = '«'

"airline symbols
set laststatus=2

"airline buffer options
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
