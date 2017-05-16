" Based on AdamWhittingham/vim-config, optimised according to my usage, mostly java and ruby development

" ----------------------------------------------
" Use junegunn/vim-plug to manange plug-ins
" ----------------------------------------------
call plug#begin('~/.vim/plugged')

" UI
Plug 'airblade/vim-gitgutter'                                 " Show the column of changes to the file against git
Plug 'vim-airline/vim-airline'                                " Add a nicer status line
Plug 'vim-airline/vim-airline-themes'                         " Themes for Airline

call plug#end()

" ----------------------------------------------
" Configure GitGutter
" ----------------------------------------------
" Set the git gutter colors to be the same as the number column
hi clear SignColumn

" Set the Gutter to show all the time, avoiding the column 'pop' when saving
let g:gitgutter_sign_column_always = 1
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_modified_removed = '~'
let g:gitgutter_max_signs = 1000

nmap <leader>gt :GitGutterToggle<CR>				" <Leader>gt to toggle the gutter
nmap <leader>gh :GitGutterLineHighlightsToggle<CR>	" <Leader>gh highlight changed lines
nmap <Leader>ga <Plug>GitGutterStageHunk			" <Leager>ga to add the current git hunk to git staging
nmap <Leader>gu <Plug>GitGutterUndoHunk				" <Leader>gu to undo the current changed hunk

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


