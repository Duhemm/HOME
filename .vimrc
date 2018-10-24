set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'derekwyatt/vim-scala'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'airblade/vim-gitgutter'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'tpope/vim-fugitive'
Plugin 'dkprice/vim-easygrep'
Plugin 'Raimondi/delimitMate'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'majutsushi/tagbar'
Plugin 'qpkorr/vim-bufkill'
Plugin 'mileszs/ack.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'lervag/vimtex'
Plugin 'morhetz/gruvbox'
Plugin 'leafgarland/typescript-vim'
Plugin 'natebosch/vim-lsc'
" Plugin 'prabirshrestha/async.vim'
" Plugin 'prabirshrestha/vim-lsp'
Plugin 'ryanoasis/vim-devicons'
Plugin 'mhartington/oceanic-next'
Plugin 'jdkanani/vim-material-theme'

set encoding=UTF-8

  " Enable mouse support
set mouse=a

  " Automatically reload file
set autoread

  " Show line numbers
set number

  " Break lines at word (requires Wrap lines)
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

  " Always case-insensitive
set ignorecase

  " Auto-indent new lines
set autoindent

  " Use spaces instead of tabs
set expandtab

  " Number of auto-indent spaces
set shiftwidth=4

  " Enable smart-indent
set smartindent

  " Enable smart-tabs
set smarttab

  " Show row and column ruler information
set ruler

  " Number of undo levels
set undolevels=1000

  " Backspace behaviour
set backspace=indent,eol,start

  " Syntax highligting
syntax enable

  " Enable filetype detection
filetype on

  " Enable filetype plugin
filetype plugin on

  " File type specific indentation
filetype indent on

  " Add spell checking and automatic wrapping at the recommended 72 columns to commit messages
autocmd Filetype gitcommit setlocal spell textwidth=72

  " Nice colors
set term=xterm-256color
set background=dark
" colorscheme solarized
" colorscheme gruvbox
set t_Co=256

" for vim 8
 " if (has("termguicolors"))
 "  set termguicolors
 " endif

colorscheme OceanicNext

" Taken from https://github.com/altercation/solarized/issues/146
" if exists('g:colors_name') && g:colors_name == 'solarized'
"     " Highlighted text is unreadable in Terminal.app because it
"     " does not support setting of the cursor foreground color.
"     if !has('gui_running') && $TERM_PROGRAM == 'Apple_Terminal'
"         let g:solarized_termcolors = &t_Co
"         let g:solarized_termtrans = 1
"         colorscheme solarized
"     endif
" endif

  " Ruler at 100th column
set colorcolumn=100
"highlight ColorColumn ctermbg=254

  " Highlight current line
set cursorline
" hi CursorLine cterm=NONE ctermbg=234

  " Visual autocomplete menu
set wildmenu

  " Don't automatically check syntax of Scala files on save
let g:syntastic_mode_map = { "mode": "active",
                           \ "passive_filetype": ["scala"] }

  " Set leader key to ","
let mapleader=","

set tags=tags;/Users/martin

  " <leader>s to remove trailing white spaces
nnoremap <leader>s :StripWhitespace<CR>

  " Shortcut to stop highlighting search results
noremap <leader>q :set hlsearch! hlsearch?<CR>

  " Always show statusline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme = 'oceanicnext'

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
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.class,*/target/*     " MacOSX/Linux"
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

let g:ctrlp_cache_dir = './.cache/ctrlp'

   " Use ag to make ctrlp faster.
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

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

  " Expand <CR> and space in delimitMate
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1

  " Use leader + g for go to definition
nnoremap <leader>g <C-]>

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

  " Use ag for vimgrep
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

  " Close buffers with <leader>x
map <leader>x :BD<CR>
map <leader>X :bufdo BD<CR>

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

nnoremap <leader>t :TagbarToggle<CR>
let g:tagbar_width = 30

" natebosch's LSP client
set completeopt-=preview
let g:lsc_server_commands = {'scala': "/Users/martin/utils/shell/start-scala-lsp", 'typescript': "typescript-language-server --stdio"}
let g:lsc_auto_map = v:true " Use defaults
    " pip install python-language-server
" au User lsp_setup call lsp#register_server({
"     \ 'name': 'dotty-ide',
"     \ 'cmd': {server_info->['start-dotty-ide']},
"     \ 'whitelist': ['scala'],
"     \ })

" Use <C-j/k> for going down/up in completion menu
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

" Discard preview window when the cursor is moved
autocmd CursorMoved * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Typescript stuff
autocmd Filetype typescript setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
