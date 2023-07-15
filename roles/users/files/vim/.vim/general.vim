filetype on

"=============================================
" Visual configs
"=============================================

highlight Search cterm=underline
"buffer is hinden on iddle
set hidden

"always show status line
set laststatus=2

"highlight matching
set showmatch
set number " line numbers
"dont redraw on maracos
set lazyredraw

"enable mouse
set mouse=a

"allways show current postion
set ruler

"text dont wrap
set wrap

"show cmd
set showcmd

"highlight line with cursor
set cursorline

set showmode

set softtabstop=4


"enable folding
set foldenable

set foldlevelstart=10
set foldnestmax=10      " 10 nested fold max
set foldmethod=indent   " fold based on indent level
set guifont=Source\ Code\ Pro:h13
set autoindent
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set undofile " set undotree to save to file
"=============================================
" SEARCH CONFIGS
"=============================================
"highlight search results
set hlsearch

"makes search with modern behavious
set incsearch

"=============================================
" MISC
"=============================================
"disable backup temp files
set nobackup
set nowb
set noswapfile

"set max history
set history=100

"set backspace to work as it should
set backspace=indent,eol,start
set colorcolumn=120

"text enconding
set encoding=utf-8

"text formating
set formatoptions=qrn1

set matchtime=3
set modelines=0

"set number of lines above and below the cursor
set scrolloff=3

"site of tab in spaces
set tabstop=4 shiftwidth=4 expandtab
set ttyfast
set undolevels=250
set visualbell

"paste
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

"=============================================
" WILDMENU COMPLETATION
"=============================================
set wildmenu
set wildmode=list:longest
set wildignore+=.hg,.git,.svn " Version Controls"
set wildignore+=*.aux,*.out,*.toc "Latex Indermediate files"
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg "Binary Imgs"
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest "Compiled Object files"
set wildignore+=*.spl "Compiled speolling world list"
set wildignore+=*.sw? "Vim swap files"
set wildignore+=*.DS_Store "OSX SHIT"
set wildignore+=*.luac "Lua byte code"
set wildignore+=migrations "Django migrations"
set wildignore+=*.orig "Merge resolution files"
