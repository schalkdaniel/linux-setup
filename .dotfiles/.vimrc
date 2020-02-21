" BASIC CONFIGS
" ===========================================================


set backupdir=~/.vim_files/.backup/,.,~/tmp,/var/tmp,/tmp
set directory=~/.vim_files/.swp/,.,~/tmp,/var/tmp,/tmp
set undodir=~/.vim_files/.undo/,.,~/tmp,/var/tmp,/tmp


set ve+=onemore		" Enable curser to be AFTER the last letter

set number		" Add line numbers to files
" set spell          	" Enable spell checking

set tabstop=2        	" Defines the blanks of a tab
set shiftwidth=2	" Defines how many blanks a shift (<C-t> or <C-d>) is
set expandtab		" Use spaces instead of tabs!
set autoindent          " Should do indenting automatically
set smartindent		" Should do indenting automagically
set cindent          	" Indenting for C type languages
set showcmd             " Shows the commands in the lower right corner
set mouse=a

set clipboard=unnamedplus
set backspace=indent,eol,start

autocmd BufWritePre * %s/\s\+$//e 	" Trim trialing white spaces

" A nicer highlighting of spelling errors:
hi clear SpellBad
hi SpellBad cterm=underline ctermfg=red

" Automatically close paranthesis:
"inoremap " ""<left>
"inoremap ' ''<left>
"inoremap ( ()<left>
"inoremap [ []<left>
"inoremap { {}<left>
"inoremap {<CR> {<CR>}<ESC>O
"inoremap {;<CR> {<CR>};<ESC>O



" PLUGIN SECTION
" ===========================================================

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'

call plug#begin('~/.vim/plugged')

" Plugin for file explorer on left side: https://github.com/scrooloose/nerdtree
Plug 'scrooloose/nerdtree'

" Plugin for C++ highlighting: https://github.com/bfrg/vim-cpp-modern
Plug 'bfrg/vim-cpp-modern'

" Plugin for C++ autocompletion based on clang (required here!): https://github.com/xavierd/clang_complete
Plug 'xavierd/clang_complete'

" R plugin: https://github.com/jalvesaq/Nvim-R
Plug 'jalvesaq/Nvim-R'

" Efficient move commands: https://github.com/matze/vim-move
Plug 'matze/vim-move'

" Easy editing of parantheses:
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'



call plug#end()


" Nvim-R:
" ------------------------

" Set window with and height of Nvim-R:
if winwidth(0) < 1200
	let R_rconsole_width = winwidth(0)
else
	let R_rconsole_width = winwidth(0) / 2
endif

let R_pdfviewer = 'evince'
let g:R_assign = 0                  " Don't create the assign arrow when typing "_"

" Send line to R console
autocmd VimEnter * map <C-l> 0\lj


" vim-move:
" -----------------------

" Set Strg as key to move up/down lines (vim-move):
let g:move_key_modifier = 'C'

" Custom commands:
" -----------------------

" Custom command to enter a new line in normal mode
map <Enter> O<ESC>

" Required for clang complete
let g:clang_library_path='/usr/lib64/libclang.so.9'

" Start nerdtree from the beginning:
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

