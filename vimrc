" Based on AdamWhittingham/vim-config, optimised according to my usage, mostly java and ruby development

" ----------------------------------------------
" Use junegunn/vim-plug to manange plug-ins
" ----------------------------------------------
call plug#begin('~/.vim/plugged')

" UI
Plug 'airblade/vim-gitgutter'                                 " Show the column of changes to the file against git
Plug 'vim-airline/vim-airline'                                " Add a nicer status line
Plug 'vim-airline/vim-airline-themes'                         " Themes for Airline
Plug 'mhinz/vim-startify'                                     " Start Vim with a more useful start screen
Plug 'tpope/vim-repeat'                                       " Make many more operations repeatable with `.`

" Search and file exploring
Plug 'jlanzarotta/bufexplorer'                                " Show a sortable list of open buffers


call plug#end()

" ----------------------------------------------
" Setup basic Vim behaviour
" ----------------------------------------------
let mapleader = " "     " Setup the leader key, used for triggering all kinds of awesome things

map , <leader>          " for the sake of muscle memory
map ,, <leader><leader>


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

nmap <leader>gt :GitGutterToggle<CR>                        " <Leader>gt to toggle the gutter
nmap <leader>gh :GitGutterLineHighlightsToggle<CR>          " <Leader>gh highlight changed lines
nmap <Leader>ga <Plug>GitGutterStageHunk                    " <Leager>ga to add the current git hunk to git staging
nmap <Leader>gu <Plug>GitGutterUndoHunk             " <Leader>gu to undo the current changed hunk

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
set laststatus=2                                           " Always show status line.

" ----------------------------------------------
" Setup Startify
" ----------------------------------------------

" Setup vim-startify's start screen
let g:startify_change_to_vcs_root = 1
let g:startify_files_number = 6
let g:startify_custom_header = [
      \ '   __      __            ',
      \ '   \ \    / (_)          ',
      \ '    \ \  / / _ _ __ ___  ',
      \ '     \ \/ / | | `_ ` _ \ ',
      \ '      \  /  | | | | | | |',
      \ '       \/   |_|_| |_| |_|',
      \ '                         ',
      \ ]

let g:startify_custom_footer = [
      \'',
      \"   Vim is charityware. Please read ':help uganda'",
      \]

let g:startify_list_order = [
      \ ['   Recent files in this directory:'],
      \ 'dir',
      \ ['   Bookmarks:'],
      \ 'bookmarks',
      \ ['   Sessions:'],
      \ 'sessions',
      \ ]

let g:startify_skiplist = [
      \ 'COMMIT_EDITMSG',
      \ ]

let g:startify_bookmarks = [
      \ { 'v': '~/.vim/vimrc' },
      \ ]

" Stop things splitting with Startify and replace it instead
autocmd User Startified setlocal buftype=

" ----------------------------------------------
" Configure Buffer Explorer
" ----------------------------------------------
let g:bufExplorerDefaultHelp=1
let g:bufExplorerDisableDefaultKeyMapping=1

nmap <silent> <unique> <Leader>. :BufExplorer<CR>     " <leader>. to view all document buffers
map <silent> <Leader><Leader> :b#<CR>                 " Double leader to switch to the previous buffer

set hidden                                            " Allow buffer switching without saving