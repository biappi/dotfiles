" This is the template .vimrc
"
" Some defaults to start off with
" F2 = toggle line numbering
" F3 = toggle showing invisible characters
" F4 = previous color scheme
" F5 = next color scheme

syntax on                       " Syntax highlighting
set background=dark             " Terminal with a dark background
set t_Co=256
colorscheme oceanblack          " Color scheme
set expandtab                   " Make a tab to spaces, num of spaces set in tabstop
set shiftwidth=4                " Number of spaces to use for autoindenting
set tabstop=4                   " A tab is four spaces
set smarttab                    " insert tabs at the start of a line according to
set list                        " show invisible characters
set listchars=tab:>·,trail:·    " but only show tabs and trailing whitespace
set number                      " Enable line numbers
set numberwidth=3               " Line number width
" Set f2 to toggle line numbers
nmap <f2> :set number! number?<cr>
" Set f3 to toggle showing invisible characters
nmap <f3> :set list! list?<cr>
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
highlight NonText ctermfg=8 guifg=gray
" work around booking shit
" let g:syntastic_puppet_validate_disable = 1
" let g:syntastic_puppet_lint_disable = 1

source ~/.vim/cyclecolor.vim
