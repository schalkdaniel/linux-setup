" BASIC CONFIGS
" ===========================================================

" For clipboard check `:help clipboard` and install `xclip`

let mapleader = "\<Space>"

set backupdir=~/.vim_files/.backup/,.,~/tmp,/var/tmp,/tmp
set directory=~/.vim_files/.swp/,.,~/tmp,/var/tmp,/tmp
set undodir=~/.vim_files/.undo/,.,~/tmp,/var/tmp,/tmp

set ve+=onemore		" Enable cursor to be AFTER the last letter
set noequalalways " Do not always resize panes after closing one

set number	         	" Add line numbers to files
" set spell          	" Enable spell checking
set tabstop=2         " Defines the blanks of a tab
set shiftwidth=2	    " Defines how many blanks a shift (<C-t> or <C-d>) is
set autoindent        " Should do indenting automatically
set smartindent		    " Should do indenting automagically
set cindent          	" Indenting for C type languages
set showcmd           " Shows the commands in the lower right corner
set mouse=a
set relativenumber
set splitbelow
set hlsearch
set statusline+=%F\ p=%c\ %m
set encoding=utf-8
set spell
set spelllang=en_us,de_de

"set clipboard=unnamedplus
set backspace=indent,eol,start

autocmd BufWritePre * %s/\s\+$//e 	" Trim trialing white spaces

" Set Ctrl as escape command for terminal insert mode:
tnoremap <Esc> <C-\><C-n> " Escape temrminal instert mode with escape
" autocmd TermOpen * startinsert " Start terminal in insert mode
au TermOpen * setlocal nospell " No spell check in terminal

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" For python:
autocmd BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix

:set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:.
:set list

" Gray highlighting for white spaces:
hi Whitespace ctermfg=DarkGray
match Whitespace /\s/
match Whitespace /\s/

" A nicer highlighting of spelling errors:
hi clear SpellBad
hi SpellBad cterm=underline ctermfg=red

" Custom command to enter a new line in normal mode
map <Enter> O<ESC>

" Colors at https://vim.fandom.com/wiki/Xterm256_color_names_for_console_Vim
"syntax on
"hi Visual cterm=NONE ctermfg=NONE ctermbg=237 guibg=#3a3a3a
"hi Search ctermbg=107 ctermfg=15

" PLUGIN SECTION
" ===========================================================

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'

call plug#begin('~/.vim/plugged')

" Plugin for file explorer on left side: https://github.com/scrooloose/nerdtree
Plug 'scrooloose/nerdtree'

" Plugin for C++ autocompletion based on clang (required here!): https://github.com/xavierd/clang_complete
"Plug 'xavierd/clang_complete'

" Efficient move commands: https://github.com/matze/vim-move
Plug 'matze/vim-move'

" Easy  editing of parantheses:
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'

" Comment shortcuts for a lot of languages
Plug 'preservim/nerdcommenter'

" Autocompletion for varius programming languages
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Install R:
" install.packages("languageserver")
" :CocInstall coc-r-lsp
" :CocInstall coc-jedi
" yay -S python-jedi

" Neoterm for sending code into terminal buffer:
"Plug 'kassio/neoterm' " Removed because of python issues.
Plug 'karoliskoncevicius/vim-sendtowindow'

" color preview for vim
Plug 'gko/vim-coloresque'


call plug#end()

" Neoterm:
" -----------------------

nnoremap <silent> <leader>j :TREPLSendLine<CR>0j
vnoremap <silent> <leader>j :TREPLSendSelection<CR>

" vim-move:
" -----------------------

" Set Strg as key to move up/down lines (vim-move):
let g:move_key_modifier = 'C'
let g:move_key_modifier_visualmode = 'C'

" Custom commands:
" -----------------------

" Required for clang complete
"let g:clang_library_path='/usr/lib64/libclang.so.10'

" Start nerdtree from the beginning:
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let NERDTreeShowHidden=1

nnoremap <silent> <expr> <C-n> g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"

" coc-nvim
" ------------------------------

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use Ctrl + Enter to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-Enter> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Stop indenting for python
let g:neoterm_bracketed_paste=1
"let g:neoterm_repl_python = 'python --no-autodindent'
