call plug#begin('~/.vim/plugged')

" spacemacs theme
Plug 'liuchengxu/space-vim-dark'

" tmuxline
Plug 'edkolev/tmuxline.vim'

" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" nerdtree
Plug 'scrooloose/nerdtree'

" git
Plug 'Xuyuanp/nerdtree-git-plugin' | Plug 'airblade/vim-gitgutter'

" Class/module browser
Plug 'majutsushi/tagbar'

" fuzzy finder
Plug 'ctrlpvim/ctrlp.vim'

" jedi
Plug 'davidhalter/jedi-vim'

" ncm2
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-jedi'

" Asynchronous Lint Engine
Plug 'w0rp/ale'

" ag
Plug 'rking/ag.vim'

" parenthesis
Plug 'jiangmiao/auto-pairs'

" surrounding
Plug 'tpope/vim-surround'

" supertab
"Plug 'ervandew/supertab'

" Initialize plugin system
call plug#end()

" color scheme
set termguicolors
set background=dark
"colorscheme solarized
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

" tmuxline
let g:tmuxline_theme = 'powerline'
let g:tmuxline_preset = 'powerline'
let g:airline#extensions#tmuxline#enabled = 1
let g:tmuxline_powerline_separators = 0

" vim build-ins
set nocompatible
syntax on
"set nobackup
set nu nornu
set showcmd
set scrolloff=5
set backspace=indent,eol,start
"set showmatch
"set matchtime=1
" search handling
set hlsearch
set incsearch
set ignorecase
set smartcase
" tabs and spaces handling
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set softtabstop=4
" always show status bar
set ls=2
"  "if $TERM_PROGRAM =~ "iTerm"
"  "    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"  "    let &t_SR = "\<Esc>]50;CursorShape=2\x7"
"  "    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
"  "endif
" for gitgutter
set updatetime=1000

" key bindings
imap <C-C> <esc>
"tab navigation mappings
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
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"nnoremap <C-R> <C-W><C-R>

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
let g:ale_linters = {'python': ['pylint', 'flake8']}
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

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

" NCM2
" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()
" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

set shortmess+=c

" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <c-c> <ESC>

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
