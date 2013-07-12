syntax on
set t_Co=256
set background=dark
set expandtab
set shiftwidth=4
set tabstop=4
set smarttab
set incsearch
set hlsearch
set number
set mouse=a

let g:solarized_termcolors=256
colorscheme solarized

highlight LineNr ctermfg=darkgray ctermbg=black
highlight VertSplit ctermfg=59 ctermbg=59 cterm=NONE 

highlight Normal          ctermfg=252

set fillchars+=vert:\ 

execute pathogen#infect()
