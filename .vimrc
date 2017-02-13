"MY CONF FOR VIM
"
"###################################################################################################

"PLUG SECTION

call plug#begin('~/.vim/plugged')

"CrtlP
Plug 'https://github.com/kien/ctrlp.vim'
"NerdTree
Plug 'https://github.com/scrooloose/nerdtree'
"YouCompleteMe
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
"Ack
Plug 'https://github.com/mileszs/ack.vim'
"JellyBeans
Plug 'nanotech/jellybeans.vim', { 'tag': 'v1.6' }
"Vim CPP highlight
Plug 'vim-cpp-enhanced-highlight'
"Switch
Plug 'https://github.com/AndrewRadev/switch.vim'
"FSwitch
Plug 'https://github.com/derekwyatt/vim-fswitch'
"NERD Commenter
Plug 'scrooloose/nerdcommenter'
"AirLine PromptLine for VIM
Plug 'https://github.com/vim-airline/vim-airline'
"Git Wrapper for VIM fugitive
Plug 'https://github.com/tpope/vim-fugitive'
"Additional Tools
Plug 'ntpeters/vim-better-whitespace'
Plug 'majutsushi/tagbar'
Plug 'kien/rainbow_parentheses.vim'
Plug 'craigemery/vim-autotag'
call plug#end()

"###################################################################################################

"PLUGS CONFIGURATION

"###################################################################################################

"Set leader

let mapleader = " "

"###################################################################################################

"NERD TREE CONFIGURATION

nnoremap <leader>nrd :NERDTree<cr>
nnoremap <leader>nrf :NERDTreeFind<cr>

"###################################################################################################

"HIGHLIGHT PLUG CONF

let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_concepts_highlight = 1
let c_no_curly_error=1

"###################################################################################################

"YCM CONFIGURATION
"Jump to location under cursor
nnoremap <leader>yj :YcmCompleter GoTo<cr>
"Restart server = clean RAM
nnoremap <leader>yr :YcmRestartServer<cr>
" let g:ymc_global_ymc_extra_conf = '/home/krul/.ymc_extra_conf.py'
let g:ymc_confirm_extra_conf = 0
let g:ycm_min_num_of_chars_for_completion = 2

"###################################################################################################
"FShearch CONFIGURATION
"Switch to the file and load it into the current window >
nnoremap<silent> <Leader>of :FSHere<cr>
"Switch to the file and load it into the window on the right >
nnoremap <silent> <Leader>oL :FSRight<cr>
"Switch to the file and load it into a new window split on the right >
nnoremap <silent> <Leader>ol :FSSplitRight<cr>
"Switch to the file and load it into the window on the left >
nnoremap <silent> <Leader>oH :FSLeft<cr>
"Switch to the file and load it into a new window split on the left >
nnoremap <silent> <Leader>oh :FSSplitLeft<cr>
"Switch to the file and load it into the window above >
nnoremap <silent> <Leader>ok :FSAbove<cr>
"Switch to the file and load it into a new window split above >
nnoremap <silent> <Leader>oK :FSSplitAbove<cr>
"Switch to the file and load it into the window below >
nnoremap <silent> <Leader>oj :FSBelow<cr>
"Switch to the file and load it into a new window split below >
nnoremap <silent> <Leader>oJ :FSSplitBelow<cr>

"NERD Comment Conf
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

"###################################################################################################

"Rainbow parantheses
"
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['red',         'firebrick3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ]

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

" au VimEnter * RainbowParenthesesToggle
" au Syntax * RainbowParenthesesLoadRound
" au Syntax * RainbowParenthesesLoadSquare
" au Syntax * RainbowParenthesesLoadBraces

"###################################################################################################

"TagBar

nnoremap <leader>tt :TagbarToggle<cr>

"###################################################################################################

"AirLine

let g:airline_section_warning=''
let g:airline_theme='dark'
let g:airline_exclude_preview=1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_symbols.space = "\ua0"
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_powerline_fonts=1

" show opened buffers as tabs
let g:airline#extensions#tabline#enabled = 1

nnoremap <F5> :bp<cr>
nnoremap <F8> :bn<cr>

"###################################################################################################

set mouse=a

syntax on

set nocompatible

set modelines=0

"###################################################################################################

" TAB SETTINGS

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

"###################################################################################################

"BASIC SETTINGS
set clipboard=unnamedplus
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set number
set undofile

"###################################################################################################

"SETTING SWAP BACKUP AND UNDO DIRECTORYi

set undodir=~/.vim/.undo//
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//

"###################################################################################################

"SEARCHING/MOVING

nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>

nnoremap <tab> %
vnoremap <tab> %

"###################################################################################################
"Highlight jelly beans scheme
colorscheme jellybeans

" Highlight columns 80 and 120
let &colorcolumn='100,120'

"HANDLE OF LONG LINE

set wrap
set textwidth=99
set formatoptions=qrn1
let colorcolumn=join(range(81,999),",")
highlight ColorColumn ctermbg=235 guibg=#2c2d27
let $colorcolumn="80,".join(range(120,999),",")

"CONF FOR NOOB

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

"###################################################################################################

"SET F1 as ESC

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

"###################################################################################################

"SET ; as :

nnoremap ; :

"###################################################################################################

"ALWAYS SAVE AFTER TABBING AWAY

au FocusLost * :wa

"###################################################################################################

"SET JJ TO SWICH TO NORMAL MODE

inoremap jj <ESC>

"###################################################################################################

"OPENING MY .vimrc IN SPLIT WINDOW

nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

"###################################################################################################

"HANDLING SPLIT WINDOWS

nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"###################################################################################################








