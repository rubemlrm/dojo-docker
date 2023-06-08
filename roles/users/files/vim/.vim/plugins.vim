"=============================================
" PLUGIN SETTINGS
"=============================================

"=============================================
" VIM PLUG
"=============================================
nnoremap <leader>pu :PlugUpdate<CR>
nnoremap <leader>pc :PlugClean<CR>
nnoremap <leader>pi :PlugInstall<CR>


"============================================
" NERDTREE
"===========================================
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

"heck if NERDTree is open or active
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufRead * call SyncTree()

"=============================================
" UNDOTREE
"=============================================
nnoremap <C-u> :UndotreeShow<CR>
if has("persistent_undo")
  let target_path = expand('~/.undodir')
  " create the directory and any parent directories
  "     " if the location does not exist.
  if !isdirectory(target_path)
      call mkdir(target_path, "p", 0700)
  endif
  let &undodir=target_path
  set undofile
endif


"=============================================
" TAGBAR
"=============================================
nmap <C-t><C-b> :TagbarToggle<CR>

"=============================================
" ALE
"=============================================
let g:ale_disable_lsp = 1
let g:ale_sign_column_always = 1
" Run both javascript and vue linters for vue files.
let b:ale_linter_aliases = ['javascript', 'vue']
" " Select the eslint and vls linters.
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'yaml': ['yamllint','ansible-lint'],
\   'yml': ['yamllint','ansible-lint'],
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'yaml': ['yamlfix'],
\   'yml': ['yamlfix']
\}


let g:ale_list_window_size = 10
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
nmap <silent> <C-g><C-e> :ALEDetail<CR>
nmap <silent> <C-g><C-d> :ALEGoToDefinition<CR>
nmap <silent> <C-f><C-r> :ALEFindReferences<CR>
nmap <silent> <C-g><C-r> :ALERename<CR>
nmap <silent> <C-k> :ALEHover<CR>

"=============================================
" NERDTREE
"=============================================
nmap <silent> <C-e> :NERDTreeToggle<CR>
map <Leader>n <plug>NERDTreeTabsToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeDirArrows = 1
map <leader>re :NERDTreeFind<cr>
"=============================================
" FUGITIVE
"=============================================
nnoremap <Leader>gr :Gremove<CR>
nnoremap <Leader>gl :Glog<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gm :Gmove
nnoremap <Leader>gp :Ggrep
nnoremap <Leader>gR :Gread<CR>
nnoremap <Leader>gg :Git<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gv :Git pull origin<CR>
nnoremap <Leader>gx :Git commit -m ""
nnoremap <Leader>gc :Git push<CR>

"=============================================
" GIT GUTTER
"=============================================
nmap <Leader>ha <Plug>GitGutterStageHunk
nmap <Leader>hu <Plug>GitGutterRevertHunk
nmap <Leader>hv <Plug>GitGutterPreviewHunk

"=============================================
" AIRLINE
"=============================================

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline_theme='minimalist'
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

"=============================================
" FZF
"=============================================
nmap <C-p> :FZF<CR>
nnoremap <silent> <C-f> :Rg<CR>
nnoremap <C-b> :Buffers<CR>
let g:rg_derive_root='true' " maintain root base dir
let g:fzf_command = 'rg'
"=============================================
" VIM-TEST
"=============================================
if has('nvim')
  let test#strategy='neovim'
else
  let test#strategy='vimterminal'
endif
let test#python#runner = 'pytest'
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

"============================================
"  STARTIFY
"============================================
let g:startify_bookmarks = systemlist("cut -sd' ' -f 2- ~/.NERDTreeBookmarks")
" Read ~/.NERDTreeBookmarks file and takes its second column
function! s:nerdtreeBookmarks()
    let bookmarks = systemlist("cut -d' ' -f 2- ~/.NERDTreeBookmarks")
    let bookmarks = bookmarks[0:-2] " Slices an empty last line
    return map(bookmarks, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_lists = [
        \ { 'type': function('s:nerdtreeBookmarks'), 'header': ['   NERDTree Bookmarks']}
        \]

function! GetUniqueSessionName()
  let path = fnamemodify(getcwd(), ':~:t')
  let path = empty(path) ? 'no-project' : path
  let branch = gitbranch#name()
  let branch = empty(branch) ? '' : '-' . branch
  return substitute(path . branch, '/', '-', 'g')
endfunction

autocmd User        StartifyReady silent execute 'SLoad '  . GetUniqueSessionName()
autocmd VimLeavePre *             silent execute 'SSave! ' . GetUniqueSessionName()

"=============================================
" COC SNIPPETS
"=============================================
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'


"=============================================
" GUNDO
"=============================================
let undotree_WindowLayout = 3
let undotree_SetFocusWhenToggle = 1
nnoremap <c-u> :UndotreeToggle<CR>
if has("persistent_undo")
   let target_path = expand('~/.undodir')

    " create the directory and any parent directories
    " if the location does not exist.
    if !isdirectory(target_path)
        call mkdir(target_path, "p", 0700)
    endif

    let &undodir=target_path
    set undofile
endif

"==============================================
" FLUXOTERM
"==============================================
nnoremap <c-g> :FloatermNew lazygit<cr>


"==============================================
" VIM-GO
"==============================================
let g:go_highlight_structs = 1
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_types = 1
let g:go_highlight_function_calls = 1

"=============================================
" END SETTINGS PLUGIN
"=============================================
