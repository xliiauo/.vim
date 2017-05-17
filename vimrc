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
Plug 'ctrlpvim/ctrlp.vim'                                     " Really powerful fuzzy finder for file names
Plug 'mileszs/ack.vim'                                        " Replace the deprecated rking/ag.vim
Plug 'scrooloose/nerdtree'                                    " Visualise the project directory and make it easy to navigate
Plug 'timakro/vim-searchant'                                  " Better highlighting when searching in file

" Additional contextual information
Plug 'tpope/vim-projectionist'                                " Map tools and actions based on the project

" Extra text manipulation and movement
Plug 'tpope/vim-commentary'                                   " Quick toggle for code commenting

" Snippets and autocomplete
Plug 'ervandew/supertab'                                      " Make tab more useful in triggering Vim omni-complete
Plug 'SirVer/ultisnips'                                       " Track the ultisnips engine
Plug 'honza/vim-snippets'                                     " Popular Snippets separated from the ultisnips engine
Plug 'tpope/vim-endwise'                                      " Automatically insert programming block endings (ie. `end` in Ruby, `endif` in VimL)
Plug 'tpope/vim-ragtag'                                       " Provide bindings for closing HTML/XML tags
Plug 'ajh17/VimCompletesMe'                                   " Very lightweight completion helper

" Extra syntax highlighting and language support
Plug 'scrooloose/syntastic'                                   " The Godfather of all syntax highlighting and checking
Plug 'sheerun/vim-polyglot'                                   " A solid language pack for Vim
Plug 'janko-m/vim-test'                                       " Add test running support for lots of languages & test frameworks
Plug 'ntpeters/vim-better-whitespace'                         " Whitespace highlighting for Vim

call plug#end()

" ----------------------------------------------
" Setup basic Vim behaviour
" ----------------------------------------------
" Setup the leader key, used for triggering all kinds of awesome things
let mapleader = " "

" for the sake of muscle memory
map , <leader>
map ,, <leader><leader>

syntax on
filetype on
filetype indent on
filetype plugin on

set autoindent                          " Automatically indent based on syntax detection
set autowrite                           " Writes on make/shell commands
set backspace=start,indent,eol
set backupdir=~/.tmp,.         " Don't clutter project dirs up with swap files
set directory=~/.tmp,.
set cf                                  " Enable error files & error jumping.
set complete+=kspell
set cursorline                          " Hilight the line the cursor is on
set expandtab                           " Convert tabs to spaces AS IS RIGHT AND PROPER
set history=1000                        " Remember a decent way back
set listchars=nbsp:█,eol:¶,tab:>-,extends:»,precedes:«,trail:•
set mousehide                           " Hide the mouse cursor when typing
set nowrap                              " Line wrapping off
set number                              " line numbers
set ruler                               " Ruler on
set smarttab
set spelllang=en_gb
set t_Co=256                            " Set 256 colour mode
set tabstop=2                           " Make a tab = 2 spaces
set timeoutlen=500                      " Milliseconds to wait for another key press when evaluating commands
set wildmode=list:longest               " Shell-like behaviour for command autocompletion
set fillchars+=vert:\                   " Set the window borders to not have | chars in them
set nojoinspaces                        " Use only 1 space after "." when joining lines instead of 2

" -----------------------------------
" Setup file wildcard ignored names
" -----------------------------------

set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem          " Disable output and VCS files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*.jar                " Disable archive files
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/* " Ignore bundler and sass caches
set wildignore+=*/tmp/cache/*                                                " Ignore rails temporary asset caches
set wildignore+=node_modules/*                                               " Ignore node modules
set wildignore+=deps/*,_build/*                                              " Ignore Elixir & Phoenix deps and build
set wildignore+=*.swp,*.swo,*~,._*                                           " Disable temp and backup files

" ----------------------------------------------
" Configure font & colourscheme
" ----------------------------------------------
colorscheme adCode
set guifont=Menlo:h16

" -----------------------------------
" Search Options
" -----------------------------------
set hlsearch        " highlight search matches...
set incsearch       " ...as you type
set ignorecase      " Generally ignore case
set smartcase       " Care about case when capital letters show up

" -----------------------------------
" GUI Vim Options
" -----------------------------------
set guioptions-=T     " no toolbar
set guioptions-=m     " no menu
set guioptions+=LlRrb " Hack which adds all scrollbars so that they can be removed, line below breaks without this
set guioptions-=LlRrb " Remove all scrollbars

" ----------------------------------------------
" Command Shortcuts
" ----------------------------------------------
" Disable Ex Mode to remove confusion
nnoremap Q <Nop>

" make W and Q act like w and q
command! W :w
command! Q :q

" make Y consistent with C and D
nnoremap Y y$

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

" <Leader>gt to toggle the gutter
nmap <leader>gt :GitGutterToggle<CR>
" <Leader>gh highlight changed lines
nmap <leader>gh :GitGutterLineHighlightsToggle<CR>
" <Leager>ga to add the current git hunk to git staging
nmap <Leader>ga <Plug>GitGutterStageHunk
" <Leader>gu to undo the current changed hunk
nmap <Leader>gu <Plug>GitGutterUndoHunk

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
" Always show status line.
set laststatus=2

" ----------------------------------------------
" Setup Startify
" ----------------------------------------------
" Setup vim-startify's start screen
let g:startify_change_to_vcs_root = 1
let g:startify_files_number = 6
let g:startify_custom_header = [
      \ '   __      __',
      \ '   \ \    / (_)',
      \ '    \ \  / / _ _ __ ___',
      \ '     \ \/ / | | `_ ` _ \',
      \ '      \  /  | | | | | | |',
      \ '       \/   |_|_| |_| |_|',
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
" Allow buffer switching without saving
set hidden

" <leader>. to view all document buffers
nmap <silent> <unique> <Leader>. :BufExplorer<CR>
" Double leader to switch to the previous buffer
map <silent> <Leader><Leader> :b#<CR>

" ----------------------------------------------
" Setup NERDTree
" ----------------------------------------------
"  <Leader>m to toggle file tree (,M to select the current file in the tree)
nmap <silent> <Leader>m :NERDTreeToggle<CR>
"  <Leader>M to toggle file tree, selecting the current file
map <silent> <Leader>M :NERDTreeFind<CR>

" A whole bunch of NERDTree configuration stolen from carlhuda's janus
let NERDTreeIgnore=['\.rbc$', '\~$']

" Make NERDTree close when you open a file from it. Helps recover screen space!
let NERDTreeQuitOnOpen=1

" Disable netrw's autocmd, since we're ALWAYS using NERDTree
runtime plugin/netRwPlugin.vim
augroup FileExplorer
  au!
augroup END

let g:NERDTreeHijackNetrw = 0

" If the parameter is a directory (or there was no parameter), open NERDTree
function s:NERDTreeIfDirectory(directory)
  if isdirectory(a:directory) || a:directory == ""
    NERDTree
  endif
endfunction

" If the parameter is a directory, cd into it
function s:CdIfDirectory(directory)
  if isdirectory(a:directory)
    call ChangeDirectory(a:directory)
  endif
endfunction

" NERDTree utility function
function s:UpdateNERDTree(stay)
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      NERDTree
      if !a:stay
        wincmd p
      end
    endif
  endif
endfunction

" Utility functions to create file commands
function s:CommandCabbr(abbreviation, expansion)
  execute 'cabbrev ' . a:abbreviation . ' <c-r>=getcmdpos() == 1 && getcmdtype() == ":" ? "' . a:expansion . '" : "' . a:abbreviation . '"<CR>'
endfunction

function s:FileCommand(name, ...)
  if exists("a:1")
    let funcname = a:1
  else
    let funcname = a:name
  endif

  execute 'command -nargs=1 -complete=file ' . a:name . ' :call ' . funcname . '(<f-args>)'
endfunction

function s:DefineCommand(name, destination)
  call s:FileCommand(a:destination)
  call s:CommandCabbr(a:name, a:destination)
endfunction

" Public NERDTree-aware versions of builtin functions
function ChangeDirectory(dir, ...)
  execute "cd " . a:dir
  let stay = exists("a:1") ? a:1 : 1
  call s:UpdateNERDTree(stay)
endfunction

function Touch(file)
  execute "!touch " . a:file
  call s:UpdateNERDTree(1)
endfunction

function Remove(file)
  let current_path = expand("%")
  let removed_path = fnamemodify(a:file, ":p")

  if (current_path == removed_path) && (getbufvar("%", "&modified"))
    echo "You are trying to remove the file you are editing. Please close the buffer first."
  else
    execute "!rm " . a:file
  endif
endfunction

function Edit(file)
  if exists("b:NERDTreeRoot")
    wincmd p
  endif

  execute "e " . a:file

ruby << RUBY
  destination = File.expand_path(VIM.evaluate(%{system("dirname " . a:file)}))
  pwd         = File.expand_path(Dir.pwd)
  home        = pwd == File.expand_path("~")

  if home || Regexp.new("^" + Regexp.escape(pwd)) !~ destination
    VIM.command(%{call ChangeDirectory(system("dirname " . a:file), 0)})
  end
RUBY
endfunction

" Define the NERDTree-aware aliases
call s:DefineCommand("cd", "ChangeDirectory")
call s:DefineCommand("touch", "Touch")
call s:DefineCommand("rm", "Remove")

" ----------------------------------------------
" Setup Ack
" ----------------------------------------------
if executable('ag')
  let g:ackprg = 'ag --vimgrep --smart-case'
  cnoreabbrev Ag Ack
endif

" ----------------------------------------------
" Setup CtrlP File Finder
" ----------------------------------------------
"  <Leader>f to fuzzy search files
map <silent> <leader>f :CtrlP<cr>
"  <Leader>F to fuzzy search files in the same directory as the current file
map <silent> <leader>F :CtrlPCurFile<cr>
"  <Leader>} to Search for a tag in the current project
map <silent> <leader>} :CtrlPTag<cr>

let g:ctrlp_show_hidden = 1

" Use Ag for search if its available on this system
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor\ --ignore-case\ --column
  set grepformat=%f:%l:%c:%m,%f:%l:%m
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

" ----------------------------------------------
" Configure Projectionist
" ----------------------------------------------
" Projectionist defaults
let g:projectionist_heuristics ={
      \  "spec/*.rb": {
      \     "app/*.rb":       {"alternate": "spec/{}_spec.rb",         "type": "source"},
      \     "lib/*.rb":       {"alternate": "spec/{}_spec.rb",         "type": "source"},
      \     "spec/*_spec.rb": {"alternate": ["app/{}.rb","lib/{}.rb"], "type": "test"}
      \  },
      \  "*.java": {
      \	   "src/main/java/*.java": {"alternate": "src/test/java/{}.java",	"type": "source"},
      \    "src/test/java/*.java": {"alternate": "src/main/java/{}.java",	"type": "test"},
      \	   "*.java": {"dispatch": "javac {file}"},
      \    "*": {"make": "mvn"}
      \  }
      \}

" ----------------------------------------------
" Configure Supertab
" ----------------------------------------------
" Fix supertab/endwise incompatibility
let g:SuperTabCrMapping = 0

" ----------------------------------------------
" Configure Ultisnips
" ----------------------------------------------
let g:UltiSnipsExpandTrigger = "<C-j>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" ----------------------------------------------
" Configure Vim-test
" ----------------------------------------------
"  <Leader>t to run all tests in the current file if it is a test, otherwise
"  run the last test file
map <silent> <leader>t :TestFile<CR>
"  <Leader>t to run the tests in the scope nearest the cursor
map <silent> <leader>T :TestNearest<CR>

" ----------------------------------------------
" Configure Vim Better Whitespace
" ----------------------------------------------
" <Leader>s to strip whitespaces
nmap <leader>s :StripWhitespace<CR>
