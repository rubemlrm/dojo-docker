"=============================================
" AUTO COMMANDS
"=============================================

"" The PC is fast enough, do syntax highlight syncing from start
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync fromstart
augroup END

"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

"" txt
augroup vimrc-wrapping
  autocmd!
  autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END

"" make/cmake
augroup vimrc-make-cmake
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END

"auto +x in scripts
au Bufwritepost * if getline(1) =~ "^#!" | if getline(1) =~ "/bin/" | silent !chmod a+x <afile> | endif | endif
au BufWritePost .vimrc so $MYVIMRC
" Delete trailing whitespaces on save
autocmd BufWritePre * :%s/\s\+$//e
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Working with split screen nicely
" Resize Split When the window is resized"
autocmd VimResized * :wincmd =
autocmd VimResized * exe "normal! \<c-w>="
