" BASIC CONFIGS
" ===========================================================

" For clipboard check `:help clipboard` and install `xclip`

let mapleader = "\<Space>"

set backupdir=~/.vim_files/.backup/,.,~/tmp,/var/tmp,/tmp
set directory=~/.vim_files/.swp/,.,~/tmp,/var/tmp,/tmp
set undodir=~/.vim_files/.undo/,.,~/tmp,/var/tmp,/tmp

"set cursorcolumn
"set cursorline
"set colorcolumn=81,121
set colorcolumn=101

highlight ColorColumn ctermbg=DarkGray

set ve+=onemore		" Enable cursor to be AFTER the last letter
set noequalalways " Do not always re-size panes after closing one

set number	         	" Add line numbers to files
set spell            	" Enable spell checking
set expandtab
set autoindent
set tabstop=2         " Defines the blanks of a tab
set shiftwidth=2	    " Defines how many blanks a shift (<C-t> or <C-d>) is
set softtabstop=2
set showcmd           " Shows the commands in the lower right corner
set mouse=a
set relativenumber
set splitbelow
set hlsearch
set statusline+=%F\ p=%c\ %m
set encoding=utf-8
set spell
set spelllang=en_us,de_de

let r_indent_align_args = 0
set cindent
set cinoptions=(1s,{1s,[1s

" autocmd BufWritePre * %s/\s\+$//e 	" Trim trialing white spaces
" Function to trim trailing white spaces, copied from:
" https://vi.stackexchange.com/questions/454/whats-the-simplest-way-to-strip-trailing-whitespace-from-all-lines-in-a-file
fun! TrimWhitespaceAll()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
command! TrimWhitespaceAll call TrimWhitespaceAll()
autocmd BufWritePre * TrimWhitespace

fun! TrimWhitespacePy()
    let l:save = winsaveview()
    keeppatterns %s/[^\n ]\zs\s\+$//e
    call winrestview(l:save)
endfun
command! TrimWhitespacePy call TrimWhitespacePy()

fun! TrimWhitespace()
    " Don't strip on these filetypes
    if &ft =~ 'python'
        TrimWhitespacePy
    else
        TrimWhitespaceAll
    endif
endfun
command! TrimWhitespace call TrimWhitespace()

" Set Ctrl as escape command for terminal insert mode:
tnoremap <Esc> <C-\><C-n> " Escape temrminal instert mode with escape
" autocmd TermOpen * startinsert " Start terminal in insert mode
au TermOpen * setlocal nospell " No spell check in terminal

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" Set the characters for the 'non-visible' stuff:
setlocal listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,leadmultispace:\|.,space:.
set list

" For python:
autocmd BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 expandtab autoindent fileformat=unix
autocmd BufNewFile,BufRead *.py setlocal listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,leadmultispace:\|...,space:.
autocmd BufWritePre *.py TrimWhitespacePy


" Gray highlighting for white spaces:
hi Whitespace ctermfg=DarkGray
match Whitespace /\s/

" A nicer highlighting of spelling errors:
hi clear SpellBad
hi clear SpellCap   " word not capitalized
hi clear SpellRare  " rare word
hi clear SpellLocal " wrong spelling for selected region
hi SpellBad cterm=underline ctermfg=red
hi SpellCap cterm=underline ctermfg=red
hi SpellLocal cterm=underline ctermfg=red

" Custom command to enter a new line in normal mode
map <Enter> O<ESC>

" PLUGIN SECTION
" ===========================================================

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'

call plug#begin('~/.vim/plugged')

"Plug 'Yggdroot/indentLine'
"
" Plugin for file explorer on left side: https://github.com/scrooloose/nerdtree
Plug 'scrooloose/nerdtree'

" Plugin for C++ autocompletion based on clang (required here!): https://github.com/xavierd/clang_complete
"Plug 'xavierd/clang_complete'

" Efficient move commands: https://github.com/matze/vim-move
Plug 'matze/vim-move'

" Easy  editing of parentheses:
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'

" Comment shortcuts for a lot of languages
Plug 'preservim/nerdcommenter'

" Autocompletion for various programming languages
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Install R linting:
" install.packages("languageserver")
" :CocInstall coc-r-lsp
" Install python linting:
" yay -S python-jedi
" :CocInstall coc-jedi

" Neoterm for sending code into terminal buffer:
"Plug 'kassio/neoterm' " Removed because of python issues.
Plug 'karoliskoncevicius/vim-sendtowindow'

" color preview for vim
Plug 'gko/vim-coloresque'

Plug 'github/copilot.vim'

" Quarto support for vim.
"Plug 'vim-pandoc/vim-pandoc-syntax'
"Plug 'quarto-dev/quarto-vim'

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

" Disable to remove whitespaces of previous line when hitting enter
inoremap <Return> <Return><Space><BS>
nnoremap o o<Space><BS>
nnoremap O O<Space><BS>

" map copilot autocompletion to <C-Tab>
imap <silent><script><expr> <C-J> copilot#Accept()
let g:copilot_no_tab_map = v:true
