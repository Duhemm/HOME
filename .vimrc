set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'gmarik/vundle'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'derekwyatt/vim-scala'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'bling/vim-airline'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'airblade/vim-gitgutter'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'tpope/vim-fugitive'
Plugin 'dkprice/vim-easygrep'
Plugin 'Raimondi/delimitMate'

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

  " Shortcut to stop highlighting search results
nnoremap <leader>h :nohlsearch<CR>

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
colorscheme solarized
set t_Co=256

  " Taken from https://github.com/altercation/solarized/issues/146
if exists('g:colors_name') && g:colors_name == 'solarized'
    " Text is unreadable with background transparency.
    if has('gui_macvim')
        set transparency=0
    endif

    " Highlighted text is unreadable in Terminal.app because it
    " does not support setting of the cursor foreground color.
    if !has('gui_running') && $TERM_PROGRAM == 'Apple_Terminal'
        let g:solarized_termcolors = &t_Co
        let g:solarized_termtrans = 1
        colorscheme solarized
    endif

    call togglebg#map("<F2>")
endif

  " Ruler at 100th column
set colorcolumn=100
highlight ColorColumn ctermbg=236

  " Highlight current line
set cursorline
hi CursorLine cterm=NONE ctermbg=233 ctermfg=NONE

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

  " Always show statusline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme = 'solarized'

  " Shortcuts to use CtrlP
nnoremap <leader>r :CtrlPTag<CR>
nnoremap <leader>p :CtrlP<CR>

  " Use the current directory as root for CtrlP
let g:ctrlp_working_path_mode = 1

  " Use ag to retrieves files in CtrlP (much faster)
let g:ctrlp_user_command = 'ag %s -i -u --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore target
      \ --ignore "**/*.class"
      \ --ignore "**/*.pyc"
      \ -g ""'

let g:gitgutter_realtime = 1

  " Indentation guides
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=236
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=237

  " Show / hide NERDTree
nnoremap <leader>kb :NERDTreeToggle<CR>

  " Shortcuts to manage panes and buffers
nnoremap <leader>w <C-w>
nnoremap <leader>vs :vspl<CR>
nnoremap <leader>bs :spl<CR>
nnoremap <leader><TAB> :buffers<CR>:buffer<space>

  " Expand <CR> and space in delimitMate
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
