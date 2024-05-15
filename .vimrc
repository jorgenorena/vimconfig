" TO DO:
" - Add support for Python
" - Add support for Julia
" - Add autocompletion with YouCompleteMe (see https://dane-bulat.medium.com/vim-setting-up-a-build-system-and-code-completion-for-c-and-c-eb263c0a19a1)
" - Add indentLine
" - Add multicursors
" - Make compatible with my neovim config

" -----------------------------------------------
" Load plugins
" ------------------------------------------

set nocompatible
filetype off

" Before first launching do
" mkdir -p ~/.vim/bundle
" cd ~/.vim/bundle
" git clone clone https://github.com/VundleVim/Vundle.vim.git Vundle.vim

" For tagbar you need ctags
" apt install exuberant-ctags

" For CtrlFS install ack
" apt install ack

" To install a plugin simply use :PluginInstall or run $vim +PluginInstall

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" Download plug-ins to the ~/.vim/plugged/ directory
call vundle#begin('~/.vim/plugged')

" Let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

" Colorschemes
Plugin 'kristijanhusak/vim-hybrid-material'
Plugin 'cocopon/iceberg.vim'
Plugin 'arcticicestudio/nord-vim'
Plugin 'sjl/badwolf'
Plugin 'lifepillar/vim-solarized8'
Plugin 'scheakur/vim-scheakur'
Plugin 'Badacadabra/vim-archery'
Plugin 'NLKNguyen/papercolor-theme'
" Preview colorschemes with :color <name> (tab to see them)

" PolyGlot for language syntax highlighting and indentation
Plugin 'sheerun/vim-polyglot'
" Check disk usage with $du -hcs ~/.vim/plugged/vim-polyglot

" Auto Pairs, automatic pair completion
Plugin 'jiangmiao/auto-pairs'

" NERDTree, for a file explorer
Plugin 'preservim/nerdtree'

" Tagbar to easily navigate source files by class, function, etc
Plugin 'preservim/tagbar'

" CtrlFS for searching files
Plugin 'dyng/ctrlsf.vim'

" fswitch for switching between .h and .c/.cpp files
Plugin 'derekwyatt/vim-fswitch'

" protodef for pulling function prototypes from a .h file into implementation
" file
Plugin 'derekwyatt/vim-protodef'

" sendtoterm to send text to another window (like a terminal or REPL)
Plugin 'karoliskoncevicius/vim-sendtowindow'

" Change surrounding quotes, parenthesis, tags
Plugin 'tpope/vim-surround'

" Comfortably comment out code
Plugin 'tpope/vim-commentary'

" For latex support
Plugin 'lervag/vimtex'

" Multiple cursors!
Plugin 'mg979/vim-visual-multi'

" Status line!
Plugin 'vim-airline/vim-airline'

call vundle#end()
filetype plugin indent on

" In order to remove plugins simply comment out the line
" and run :PluginClean

" ----------------------------------------------
" auto-pairs configuration
" ----------------------------------------------

" key combination to toggle auto pairs on and off
let g:AutoPairsShortcutToggle = '<C-P>'

" ---------------------------------------------
" Tagbar configuration
" ---------------------------------------------

" Focus the panel when opening it
let g:tagbar_autofocus = 1

" Highlight the active tag
let g:tagbar_autoshowtag = 1

" Make panel vertical and place on the right
let g:tagbar_position = 'botright horizontal'

" ---------------------------------------------
" NERDTree configuration
" --------------------------------------------

let NERDTreeShowBookmarks = 1   " Show the bookmarks table
let NERDTreeShowHidden = 1      " Show hidden files
let NERDTreeShowLineNumbers = 0 " Hide line numbers
let NERDTreeMinimalMenu = 1     " Use the minimal menu (m)
let NERDTreeWinPos = "left"     " Panel opens on the left side
let NERDTreeWinSize = 31        " Set panel width to 31 columns

" --------------------------------------------
" CtrlSF configuration
" --------------------------------------------

" Use the ack tool as the backend
let g:ctrlsf_backend = 'ack'
" Auto close the results panel when opening a file
let g:ctrlsf_auto_close = { "normal":0, "compact":0 }
" Immediately switch focus to the search window
let g:ctrlsf_auto_focus = { "at":"start" }
" Don't open the preview window automatically
let g:ctrlsf_auto_preview = 0
" Use the smart case sensitivity search scheme
let g:ctrlsf_case_sensitive = 'smart'
" Normal mode, not compact mode
let g:ctrlsf_default_view = 'normal'
" Use absoulte search by default
let g:ctrlsf_regex_pattern = 0
" Position of the search window
let g:ctrlsf_position = 'right'
" Width or height of search window
let g:ctrlsf_winsize = '46'
" Search from the current working directory
let g:ctrlsf_default_root = 'cwd'

" ------------------------------------------------------------
" fswitch configuration
" ------------------------------------------------------------
"
" Set fswichdst and fswitchloc variables when BufEnter event takes place
" on a file whose name matches {*.cpp}.

au! BufEnter *.cpp let b:fswitchdst = 'hpp,h'
au! BufEnter *.h   let b:fswitchdst = 'cpp,c'

" fswitchdst  - Denotes the files extensions that is the target extension of
"               the current file's companion file.
"
" fswitchlocs - Contains a set of directories that indicate directory names 
"               that should be formulated when trying to find the alternate
"               file.

" ‐--------------------------------------------
" sendtoterm configuration
" ---------------------------------------------

let g:sendtowindow_use_defaults=0

" Define a file that bash will use when opening a vim terminal
let $BASH_ENV="~/.vim/vim_bash"

"---------------------------------------------
" Vim configuration
" --------------------------------------------

set nu		" Enable line numbers
set relativenumber " Relative line numbers
syntax on	" Enable syntax highlighting

" How many columns of whitespace a \t is worth
set tabstop=2

" How many columns of whitespace a "level of indentation" is worth
set shiftwidth=2

" Use spaces when tabbing
set expandtab
set autoindent

set cursorline  " highlight cursor
set wrap        " wrap long lines
set breakindent " indentation included in line wrapping
set linebreak

set incsearch	" Enable incremental search
set hlsearch	" Enable highlight search

set termwinsize=12x0	" Set terminal size
set splitbelow		    " Always split below
set mouse=a		        " Enable mouse drag on window splits

set background=dark    " Set backgroud
colorscheme PaperColor " Set color scheme

" -------------------------------------------
"  Which key
" -------------------------------------------

" By default timeoutlen is 1000 ms
set timeoutlen=500

" -------------------------------------------
" Key mappings
" -------------------------------------------

let mapleader = " "

" NERDTree
nmap  <Leader>ee  :NERDTreeToggle % <CR>
nmap  <Leader>ea  :NERDTreeFocus <CR>
nmap  <Leader>er  :NERDTreeRefreshRoot <CR>

" Tagbar
nmap  <Leader>t   :TagbarToggle<CR>

" CtrlSF
nmap <Leader>ff <Plug>CtrlSFPrompt
xmap <Leader>ff <Plug>CtrlSFVwordPath
" Perform search with selection (Visual Mode)
xmap <Leader>F <Plug>CtrlSFVwordExec
" Open search prompt with current word (Normal Mode)
nmap <Leader>F <Plug>CtrlSFCwordPath
nnoremap <leader>js :call SelectTexWithinCell()<CR>
" Open CtrlSF window (Normal Mode)
nnoremap <Leader>fo :CtrlSFOpen<CR>
" Toggle CtrlSF window (Normal Mode)
nnoremap <Leader>ft :CtrlSFToggle<CR>

" fswitch open .c and .h on different panels
nmap <Leader>z :vsplit <bar> :wincmd l <bar> :FSRight<CR>

" protodef
" Pull in prototypes
nmap <buffer> <silent> <leader> ,PP
" Pull in prototypes without namespace definition"
nmap <buffer> <silent> <leader> ,PN

" sendtoterm
nmap <Leader>ss <Plug>SendDown
vmap <Leader>ss <Plug>SendDownV

" splits
nmap <Leader>sh :split<CR>
nmap <Leader>sv :vsplit<CR>
nmap <Leader>sq :close<CR>
nmap <Leader>s<Up> <C-w><Up>
nmap <Leader>s<Down> <C-w><Down>
nmap <Leader>s<Left> <C-w><Left>
nmap <Leader>s<Right> <C-w><Right>
nmap <Leader>sxx :botright terminal<CR>
nmap <Leader>sxj :botright terminal ++noclose /root/julia/julia-current/bin/julia %<CR>
nmap <Leader>sj :botright terminal /root/julia/julia-current/bin/julia <CR>
nmap <leader>sxp :botright terminal ++noclose python %<CR>
nmap <leader>sp :botright terminal python<CR>
nmap <Leader>sj :botright terminal /root/julia/julia-current/bin/julia<CR>

" other
nmap <Leader>nh :nohl<CR>

" convert notebooks to script
augroup NotebookConvert
  autocmd!
  autocmd FileType json nnoremap <buffer> <leader>jws :!jupytext --to=auto:percent %<CR>
  autocmd FileType json nnoremap <buffer> <leader>jwm :!jupytext --to=md %<CR>
augroup END
augroup NotebookConvert
  autocmd!
  autocmd FileType python,julia nnoremap <buffer> <leader>jwn :!jupytext --to=ipynb --update %<CR>
augroup END


" Work with script cells
function! SelectTextWithinCell()
  let l:start_pos = searchpos('^# %%$', 'nb')
  if l:start_pos[0] == 0
    echo "No starting marker found"
    return
  endif

  let l:end_pos = searchpos('^# %%$', 'n')
  if l:end_pos[0] == 0
    echo "No ending marker found"
    return
  endif

"  echo l:start_pos[0] . ',' . l:end_pos[0]
  execute ':normal! ' . (l:start_pos[0] + 1) . 'GV' . (l:end_pos[0] - 1) . 'G'
endfunction

nnoremap <leader>js :call SelectTextWithinCell()<CR>
nnoremap <leader>jd :call SelectTextWithinCell()<CR>jd
nnoremap <leader>jy :call SelectTextWithinCell()<CR>jy
nnoremap <leader>jn o# %%
nnoremap <leader>jm o# %% [markdown]
nnoremap <leader><CR> :call SelectTextWithinCell()<CR><Plug>SendDownV
