
" Nerd Tree Mappings
nnoremap <C-n><C-t> :NERDTreeToggle<CR>
nnoremap <C-n><C-m> :NERDTreeMirror<CR>

" Show hidden files in Nerd Tree by default
let NERDTreeShowHidden=1

" after a re-source, fix syntax matching issues (concealing brackets for NerdTree):
if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif
