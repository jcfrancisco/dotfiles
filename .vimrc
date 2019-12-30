set noswapfile

" Use Vim settings, rather than Vi settings
set nocompatible

call plug#begin('~/.local/share/nvim/plugged')

" General plugins
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'altercation/vim-colors-solarized'
Plug 'kien/rainbow_parentheses.vim'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'myusuf3/numbers.vim'
Plug 'tpope/vim-sleuth'
Plug 'ludovicchabant/vim-gutentags'

" JS
Plug 'HerringtonDarkholme/yats.vim'

" Haskell
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neovimhaskell/haskell-vim'

call plug#end()

" Colors!
colorscheme solarized
if has('gui_running')
  set background=light
else
  set background=dark
endif

" Indenting defaults (does not override vim-sleuth's indenting detection)
setglobal expandtab
setglobal tabstop=2
setglobal shiftwidth=2

" Always display the status line
set laststatus=2

" Display incomplete commands
set showcmd

" Line numbers
set number
set ruler

" Syntax highlighting
syntax on
set hlsearch
set incsearch

" Display extra whitespace
set list
set listchars="tab:> ,trail:-,nbsp:+"

" case only matters with mixed case expressions
set ignorecase
set smartcase

" Tab completion options
" (only complete to the longest unambiguous match, and show a menu)
set completeopt=longest,menu
set wildmode=list:longest,list:full

set guifont=Panic\ Sans:h13
"256 colors
set t_Co=256

set nowrap

" Ignore dumb files
set wildignore+=.git,tmp,log,*.png,*.jpg,*.jpeg,*.gif,public/analytic,public/fonts,public/sounds,public/images,public/flash

" Key mappings
nnoremap <F3> :NumbersToggle<CR>

" Strip whitespace
function! TrimWhiteSpace()
  %s/\s*$//
  ''
:endfunction

autocmd FileWritePre * :call TrimWhiteSpace()
autocmd FileAppendPre * :call TrimWhiteSpace()
autocmd FilterWritePre * :call TrimWhiteSpace()
autocmd BufWritePre * :call TrimWhiteSpace()

map <F2> :call TrimWhiteSpace()<CR>
map! <F2> :call TrimWhiteSpace()<CR>

" rainbow_parenthesis.vim
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Ignore some folders and files for CtrlP indexing
" (Note that the wildignore setting above is also respected by CtrlP)
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.sass-cache$|\.hg$\|\.svn$\|\.yardoc\|public$|log\|tmp$\|node_modules$',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  \ }

" Unset cap of 10,000 files so we find everything
let g:ctrlp_max_files = 0

set clipboard=unnamedplus

" coc.nvim config - https://github.com/neoclide/coc.nvim#example-vim-configuration
source ~/.config/nvim/coc.nvim.vim
