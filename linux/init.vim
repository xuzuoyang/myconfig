" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Better file browser
Plug 'scrooloose/nerdtree'
" Class/module browser
Plug 'majutsushi/tagbar'
" Code and files fuzzy finder
Plug 'ctrlpvim/ctrlp.vim'
" NCM
Plug 'roxma/nvim-completion-manager'
" Asynchronous Lint Engine
Plug 'w0rp/ale'
Plug 'edkolev/tmuxline.vim'
" spacemacs theme
Plug 'liuchengxu/space-vim-dark'
" ag
Plug 'rking/ag.vim'
" git nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin'
" gitgutter
Plug 'airblade/vim-gitgutter'
" solarized
Plug 'iCyMind/NeoSolarized'
" parenthesis
Plug 'jiangmiao/auto-pairs'
" goto
Plug 'davidhalter/jedi-vim'
" indent
Plug 'vim-scripts/indentpython.vim'
" surrounding
Plug 'tpope/vim-surround'
" json
" Plug 'elzr/vim-json'
" Initialize plugin system
call plug#end()


"color scheme
"set termguicolors
"colorscheme NeoSolarized
set background=dark
let g:neosolarized_contrast = "normal"
let g:neosolarized_visibility = "normal"
let g:neosolarized_vertSplitBgTrans = 1
let g:neosolarized_bold = 1
let g:neosolarized_underline = 1
let g:neosolarized_italic = 0
colorscheme space-vim-dark 

"airline config
let g:airline_powerline_fonts = 0
let g:airline_theme = 'solarized'
let g:airline_solarized_bg='dark'
"let g:airline#extensions#whitespace#enabled = 0 
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1
" show absolute file path in status line
"let g:airline_section_c = '%<%F%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#'
" show tab number in tab line
let g:airline#extensions#tabline#tab_nr_type = 1

if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif
"let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = '☰'
"let g:airline_symbols.maxlinenr = ''
set ttimeoutlen=10

" tmuxline
let g:tmuxline_theme = 'powerline'
let g:tmuxline_preset = 'powerline'
let g:airline#extensions#tmuxline#enabled = 1
let g:tmuxline_powerline_separators = 0

"backspace
set backspace=indent,eol,start

"split navigations
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
nnoremap <C-h> <C-W>h
"nnoremap <C-R> <C-W><C-R>

" no vi-compatible
set nocompatible

" allow plugins by file type (required for plugins!)
filetype plugin on
filetype indent on

" always show status bar
set ls=2

" incremental search
set incsearch
" highlighted search results
set hlsearch

" syntax highlight on
syntax on

" show line numbers
set nu

" tab navigation mappings
map tn :tabn<CR>
map tp :tabp<CR>
map tm :tabm
map tt :tabnew
map tc :tabclose
map ts :tab split<CR>
map <C-S-Right> :tabn<CR>
imap <C-S-Right> <ESC>:tabn<CR>
map <C-S-Left> :tabp<CR>
imap <C-S-Left> <ESC>:tabp<CR>

" Tagbar ----------------------------- 

" toggle tagbar display
map <F4> :TagbarToggle<CR>
" autofocus on tagbar open
let g:tagbar_autofocus = 1

" NERDTree ----------------------------- 

" toggle nerdtree display
map <F3> :NERDTreeToggle<CR>
" open nerdtree with the current file selected
nmap ,t :NERDTreeFind<CR>
" don;t show these file types
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']

" ctrlp
" file finder mapping
let g:ctrlp_map = ',e'
" tags (symbols) in current file finder mapping
nmap ,g :CtrlPBufTag<CR>
" don't change working directory
let g:ctrlp_working_path_mode = 0
" ignore these files and folders on file finder
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn|node_modules)$',
  \ 'file': '\.pyc$\|\.pyo$',
  \ }

" ALE
let g:ale_set_highlights = 0
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {
\   'python': ['flake8', 'pylint'],
\}
" nmap <silent> <C-k> <Plug>(ale_previous_wrap)
" nmap <silent> <C-j> <Plug>(ale_next_wrap)

" change key
imap <C-c> <esc>

" NCM
let g:python3_host_prog = '/usr/bin/python3'
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" remove trailing whitespaces for .py files
autocmd BufWritePre *.py :%s/\s\+$//e
autocmd BufWritePre *.yaml :%s/\s\+$//e
autocmd BufWritePre *.json :%s/\s\+$//e

" Jedi-vim
let g:jedi#completions_enabled = 0

let mapleader = ","
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"
let g:jedi#force_py_version = 3
