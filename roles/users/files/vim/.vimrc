set t_Co=256 " 256 Colors
syntax on

"==============================================
" PLUGIN STUFF
"==============================================

" check if plugged is installed
if empty(glob('$HOME/.vim/autoload/plug.vim'))
 silent !curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs
                      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
 autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

let g:ale_disable_lsp = 1
call plug#begin('~/.vim/plugged')

" File Explorer
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Code completion and linting
Plug 'dense-analysis/ale'
Plug 'honza/vim-snippets'
Plug 'pearofducks/ansible-vim', { 'do': './UltiSnips/generate.sh' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Language Specific
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'mattn/emmet-vim'
Plug 'fatih/vim-go'


"Extra Utils
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'preservim/tagbar'
Plug 'vim-test/vim-test'
Plug 'mbbill/undotree'
Plug 'ap/vim-css-color'
Plug 'voldikss/vim-floaterm'
" UI Plugins
Plug 'mhinz/vim-startify'
Plug 'itchyny/vim-gitbranch'
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
call plug#end()

filetype plugin indent on

"============================================
" UI SETTINGS
"=============================================
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

set background=dark
silent! colorscheme gruvbox
" Source auxiliar configs
source $HOME/.vim/general.vim
source $HOME/.vim/plugins.vim
source $HOME/.vim/autocommands.vim
source $HOME/.vim/keybindings.vim
