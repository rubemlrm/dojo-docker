" KEYBINDING
"============================================
"Rebing <leader>key
nnoremap <SPACE> <Nop>
let mapleader = " "
"I can type :help on my own, thanks.
noremap <F1> <Esc>

"map esc to jk
:imap jk <Esc>
:imap kj <Esc>
"change saving shortcut
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a

"change quit shortcut::w
noremap <leader>q :quit<CR> "Quit current window
noremap <leader>qa :qa!<CR> "quit all windows


"past mode
set pastetoggle=<F2>

"bind ctrl movement
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

"map sort function to a key
noremap <Leader>s :sort<CR>

" ,ev Shortcut to edit .vimrc file on the fly on a vertical window.
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
nnoremap <leader>rv :source $MYVIMRC<cr>
"<Ctrl-X> -- cut (goto visual mode and cut)
imap <C-X> <C-O>vgG
vmap <C-X> "*x<Esc>im

"<Ctrl-C> -- copy (goto visual mode and copy)
imap <C-C> <C-O>vgG
vmap <C-C> "*y<Esc>i

"<Ctrl-A> -- copy all
imap <C-A> <C-O>gg<C-O>gH<C-O>G<Esc>
vmap <C-A> <Esc>gggH<C-O>G<Esc>i

"<Ctrl-V> -- paste
nm \\paste\\ "=@*.'xy'<CR>gPFx"_2x:echo<CR>
imap <C-V> x<Esc>\\paste\\"_s
vmap <C-V> "-cx<Esc>\\paste\\"_x"""""""""""


" Copy to system clipboard
noremap <leader>c "*yy<cr>

" Paste without indent
noremap<leader>v "+p<cr>

"=============================================
" SPLITS
"=============================================

"Resize vsplit
nmap <C-i> :vertical resize +5<cr>
nmap <C-d> :vertical resize -5<cr>
nmap <C-r><C-d> :resize -5<cr>
nmap <C-r><C-i> :resize +5<cr>
"fullscreen
map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>

" Open splits
nmap <C-v><C-s> :vsplit<cr>
nmap <C-h><C-s> :split<cr>

" Create split below
nmap :sp :rightbelow sp<cr>

"=============================================
" BUFFER
"=============================================

" Quickly go forward or backward to buffer
nmap <C->> :bn<cr>
nmap <C-<> :bp<cr>

"switch to last file in buffer
nmap <leader><leader> :b#<cr>

"=============================================
" VISUAL
"=============================================
nnoremap <C-F3> :if &go=~#'r'<Bar>set go-=r<Bar>else<Bar>set go+=r<Bar>endif<CR>

" space open/closes folds
nmap <leader>za za

" Create/edit file in the current directory
nmap :ed :edit %:p:h/
