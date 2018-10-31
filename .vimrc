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
Plug 'neomake/neomake'

" JS
Plug 'isRuslan/vim-es6'
Plug 'mattn/webapi-vim' " Needed for vim-babel
Plug 'jbgutierrez/vim-babel'

" Clojure
" Plug 'tpope/vim-fireplace'
" Plug 'guns/vim-clojure-static'
" Plug 'guns/vim-clojure-highlight'

" Haskell
Plug 'neovimhaskell/haskell-vim'
Plug 'parsonsmatt/intero-neovim'
Plug 'nbouscal/vim-stylish-haskell'

" Etc
Plug 'tpope/vim-cucumber'

" Unused plugins
" Plug 'mxw/vim-jsx'
" Plug 'plasticboy/vim-markdown'
" Plug 'tpope/vim-rails.git'
" Plug 'tpope/vim-endwise'
" Plug 'tpope/vim-haml'
" Plug 'juvenn/mustache.vim'
" Plug 'othree/yajs.vim'
" Plug 'airblade/vim-gitgutter'
" Plug 'wavded/vim-stylus'
" Plug 'tpope/vim-classpath'
" Plug 'kchmck/vim-coffee-script'
" Plug 'godlygeek/tabular'

call plug#end()

" Colors!
colorscheme solarized
if has('gui_running')
  set background=light
else
  set background=dark
endif

" Soft tabs, 2 spaces by default
" NOTE: `vim-sleuth` can override these if it finds different indentation
" in the current project
set expandtab
set shiftwidth=2

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

" From https://github.com/parsonsmatt/intero-neovim#example-configuration
augroup interoMaps
  au!
  " Maps for intero. Restrict to Haskell buffers so the bindings don't collide.

  " Background process and window management
  au FileType haskell nnoremap <silent> <leader>is :InteroStart<CR>
  au FileType haskell nnoremap <silent> <leader>ik :InteroKill<CR>

  " Open intero/GHCi split horizontally
  au FileType haskell nnoremap <silent> <leader>io :InteroOpen<CR>
  " Open intero/GHCi split vertically
  au FileType haskell nnoremap <silent> <leader>iov :InteroOpen<CR><C-W>H
  au FileType haskell nnoremap <silent> <leader>ih :InteroHide<CR>

  " Reloading (pick one)
  " Automatically reload on save
  " au BufWritePost *.hs InteroReload
  " Manually save and reload
  au FileType haskell nnoremap <silent> <leader>wr :w \| :InteroReload<CR>

  " Load individual modules
  au FileType haskell nnoremap <silent> <leader>il :InteroLoadCurrentModule<CR>
  au FileType haskell nnoremap <silent> <leader>if :InteroLoadCurrentFile<CR>

  " Type-related information
  " Heads up! These next two differ from the rest.
  au FileType haskell map <silent> <leader>t <Plug>InteroGenericType
  au FileType haskell map <silent> <leader>T <Plug>InteroType
  au FileType haskell nnoremap <silent> <leader>it :InteroTypeInsert<CR>

  " Navigation
  au FileType haskell nnoremap <silent> <leader>jd :InteroGoToDef<CR>

  " Managing targets
  " Prompts you to enter targets (no silent):
  au FileType haskell nnoremap <leader>ist :InteroSetTargets<SPACE>
augroup END

" Intero starts automatically. Set this if you'd like to prevent that.
let g:intero_start_immediately = 0

" Enable type information on hover (when holding cursor at point for ~1 second).
" let g:intero_type_on_hover = 1
" OPTIONAL: Make the update time shorter, so the type info will trigger faster.
" set updatetime=1000


" Neomake
let g:neomake_javascript_eslint_exe = $PWD .'/node_modules/.bin/eslint'
call neomake#configure#automake('w')
