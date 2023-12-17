
" -------------------
"  Custom functions |
" -------------------

" From your first vim plugin talk
function! FixLastSpellingError()
    normal! mm[s1z=`m
endfunction

nnoremap <leader>se :call FixLastSpellingError()<cr>

" Zooming into panes like tmux and iterm2
" Zoom / Restore window.
function! s:ZoomToggle() abort
  if exists('t:zoomed') && t:zoomed
    execute t:zoom_winrestcmd
    let t:zoomed = 0
  else
    let t:zoom_winrestcmd = winrestcmd()
    resize
    vertical resize
    let t:zoomed = 1
  endif
endfunction

command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> <C-A> :ZoomToggle<CR>

