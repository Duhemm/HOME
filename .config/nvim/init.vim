set nocompatible


  " Setup vim-plug
call plug#begin('~/.vim/plugged')

Plug 'VundleVim/Vundle.vim'              " Package manager

Plug 'airblade/vim-gitgutter'            " Git diff in gutter
Plug 'tpope/vim-fugitive'                " Git wrapper

Plug 'scrooloose/nerdtree'               " File explorer
Plug 'Xuyuanp/nerdtree-git-plugin'       " Show git status in NERD tree
Plug 'ctrlpvim/ctrlp.vim'                " Open files with <leader>-p
Plug 'qpkorr/vim-bufkill'                " Close buffer but keep split

Plug 'scrooloose/nerdcommenter'          " Manage comments
Plug 'ntpeters/vim-better-whitespace'    " Highlight and strip whitespace
Plug 'nathanaelkane/vim-indent-guides'   " Visually display indent levels
Plug 'Raimondi/delimitMate'              " Auto completion for parens, quotes, etc.
Plug 'terryma/vim-multiple-cursors'      " Multi-cursor like in sublime
Plug 'majutsushi/tagbar'                 " Outline viewer

Plug 'derekwyatt/vim-scala'              " Vim Scala integration
Plug 'leafgarland/typescript-vim'        " Vim Typescript integration
Plug 'lervag/vimtex'                     " Vim LaTeX integration
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }                                  " LSP Client

Plug 'vim-airline/vim-airline'           " Tabline
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'            " File type icons
Plug 'morhetz/gruvbox'                   " Color scheme

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

call plug#end()

set encoding=UTF-8

  " Enable mouse support
set mouse=a

  " Automatically reload file
set autoread

  " Show line numbers
set number

  " Break lines at word (requiers Wrap lines)
set linebreak

  " Wrap-broken line prefix
set showbreak=+++

  " Line wrap (number of cols)
set textwidth=100

  " Keep 10 lines visible
set scrolloff=10

  " Highlight matching brace
set showmatch

  " Use visual bell (no beeping)
set visualbell

  " Highlight all search results
set hlsearch

  " Enable smart-case search
set smartcase

  " Search as characters are entered
set incsearch

  " Auto-indent new lines
set autoindent

  " Use space instead of tabs
set expandtab

  " Number of auto-indent spaces
set shiftwidth=4

  " Enable smart-indent
set smartindent

  " Enable smat-tabs
set smarttab

  " Show row and column ruler information
set ruler

  " Number of undo levels
set undolevels=1000

  " Backspace behavior
set backspace=indent,eol,start

  " Syntax highlighting
syntax enable

  " Enable filetype detection
filetype on

  " Enable filetype plugin
filetype plugin on

  " File type specific indentation
filetype indent on

  " Add spell checking and automatic wrapping at the recommended 72 columns to
  " commit messages
autocmd Filetype gitcommit setlocal spell textwidth=72

  " Nice colors
set background=dark
set t_Co=256
colorscheme gruvbox

  " Ruler at 100th column
set colorcolumn=100

  " Highlight current line
set cursorline

  " Visual autocomplete menu
set wildmenu

  " Set leader key to `,`
let mapleader=","

  " <leader>s to remove trailing whitespaces
nnoremap <leader>s :StripWhitespace<CR>

  " <leader>q to toggle search result highlighting
noremap <leader>q :set hlsearch! hlsearch?<CR>

  " Always show statusline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme = 'gruvbox'

  " Show tabs using airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

  " Shortcuts to use CtrlP
nnoremap <leader>r :CtrlPTag<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>o :CtrlPBufTag<CR>
nnoremap <leader>p :CtrlPMixed<CR>

   " Use ctrlp from the nearest .git ancestor
let g:ctrlp_working_path_mode = 'ra'

   " Exclude these from ctrlp
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.class,*/target/*     " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_cache_dir = './.cache/ctrlp'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

  " Update git gutter in realtime
let g:gitgutter_realtime = 1

  " Indentation guides
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 1

  " Show / hide NERDTree
nnoremap <leader>kb :NERDTreeToggle<CR>
  " Focus NERDTree with ,kf
nnoremap <leader>kf :NERDTreeFocus<CR>
  " Show in NERDTree with ,ks
nnoremap <leader>ks :NERDTreeFind<CR>

  " Shortcuts to manage panes and buffers
nnoremap <leader>w <C-w>
nnoremap <leader>vs :vspl<CR>
nnoremap <leader>bs :spl<CR>
nnoremap <leader><TAB> :buffers<CR>:buffer<space>

function! PreviewHeightWorkAround()
  if &previewwindow
    exec 'setlocal winheight='.&previewheight
  endif
endfunc

  " Expand <CR> and space in delimitMate
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1

  " Copy and cut
vmap <C-x> :!pbcopy<CR>
vmap <C-c> :w !pbcopy<CR><CR>

  " Hide buffers instead of closing them when switching file.
set hidden

  " Switch buffer using ctrl + left / right
map <C-Right> :bn<CR>
map <C-Left> :bp<CR>
imap <C-Right> <ESC>:bn<CR>i
imap <C-Left> <ESC>:bp<CR>i


  " Show unsaved changes
command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis

  " Close buffers with <leader>x
map <leader>x :BD<CR>
map <leader>X :bufdo BD<CR>

  " Close preview window with <C-x>
map <C-x> :pclose<CR>

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

  " Disable annoying visual bell
set t_vb=""

" LanguageClient-neovim setup
let g:LanguageClient_serverCommands = {
    \ 'scala': ["/Users/martin/utils/shell/start-scala-lsp"],
    \ 'typescript': ["typescript-language-server", "--stdio"],
    \ 'go': ["/Users/martin/go/bin/go-langserver", "-diagnostics", "-format-tool", "gofmt", "-gocodecompletion", "-lint-tool", "golint", "-mode", "stdio"]
    \ }
let g:LanguageClient_waitOutputTimeout = 60

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> <C-]> :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
nnoremap <silent> <C-a> :call LanguageClient#textDocument_references()<CR>
nnoremap <silent> <C-i> :call LanguageClient#textDocument_implementation()<CR>
nnoremap <silent> <leader>t :call LanguageClient#workspace_symbol(input("Query: "))<CR>

set completefunc=LanguageClient#complete
" set completeopt-=long

function! DoNothingHandler(output)
endfunction

  " Is the cursor position different from the last call to this function?
function! IsDifferentPositionFromLast()
  if !exists('b:last_position_line')
    return 1
  endif

  return b:last_position_line !=# line('.') || b:last_position_col !=# col('.')
endfunction

function! UpdatePosition()
  " Only call documentHighlight if the cursor position changed, and if so,
  " remove highlights and close preview window.
  if mode() == 'n' && IsDifferentPositionFromLast()
    let b:last_position_line = line('.')
    let b:last_position_col = col('.')

    pclose
    call LanguageClient_clearDocumentHighlight()
    call LanguageClient_textDocument_documentHighlight({'handle': v:true}, 'DoNothingHandler')
  endif
endfunction

augroup LanguageClient_config
  autocmd!
  autocmd CursorMoved * call UpdatePosition()
  autocmd CursorMovedI * call LanguageClient_clearDocumentHighlight()
augroup end

" Use <C-j/k> for going down/up in completion menu
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

" Typescript stuff
autocmd Filetype typescript setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2

" Go stuff
autocmd Filetype go setlocal noexpandtab tabstop=2 shiftwidth=2 softtabstop=2

