" Based on AdamWhittingham/vim-config, optimised according to my usage, mostly java and ruby development

" ----------------------------------------------
" Use junegunn/vim-plug to manange plug-ins
" ----------------------------------------------
call plug#begin('~/.vim/plugged')

" UI
Plug 'vim-airline/vim-airline'                                " Add a nicer status line
Plug 'vim-airline/vim-airline-themes'                         " Themes for Airline


call plug#end()

" ----------------------------------------------
" Setup the status bar
" ----------------------------------------------

let g:airline_left_sep = ""
let g:airline_left_alt_sep = ""
let g:airline_right_sep = ""
let g:airline_right_alt_sep = ""
let g:airline_section_z = '%c, %l/%L'

let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#tagbar#enabled = 0
let g:airline_theme = "kalisi"

set statusline=%<%f\ %h%m%r%=%-20.(line=%l\ of\ %L,col=%c%V%)\%h%m%r%=%-40(,%n%Y%)\%P%#warningmsg#%{SyntasticStatuslineFlag()}%*
set laststatus=2                        " Always show status line.

