" -------------------
"  Custom mappings  |
" -------------------

" Insert mode mappings
" Go to new line in insert mode
inoremap <leader>nn <C-O>o

" Normal mode mappings
" Enter to new line while staying in normal mode
nnoremap ^[OM o<Esc> " Shift Enter. Insert line below
nnoremap ^[VM O<Esc> " Control Enter. Insert line above

" The mark should stay at the same place but instead its shifting a bit
" nnoremap <CR> :normal! mmo<Esc>`m           " Insert new line in normal mode

" Add mappings for moving all the content on the right of the curser goes down
" while staying in insert mode

" The mark should stay at the same place.
nnoremap <space><CR> a<CR><Esc>

" Line movement mapings
nnoremap <space>j :m+1<CR>     " Move line down
nnoremap <space>k :m-2<CR>     " Move line up


" -----------
" Custom mapping for replacing word without storing in register
" In future map it with a motion command instead of word to delete a certain
" thing and paste something you copied elsewhere in place. unless you find a
" better way to do this
nnoremap <leader>rp "_diwp

" Easily get out of terminal mode
tnoremap <Esc> <C-\><C-n>

" Shortcut to source init.vim
nnoremap <leader>so :source ~/.config/nvim/init.vim<CR>

" Go to last active tab
if !exists('g:lasttab')
  let g:lasttab = 1
endif

nnoremap <silent> gl :exe "tabn ".g:lasttab<cr>
vnoremap <silent> gl :exe "tabn ".g:lasttab<cr>
au TabLeave * let g:lasttab = tabpagenr()

" Group all leader mappings together
nnoremap <leader>nt :tabnew<CR>                 " Open a new tab
nnoremap <leader>t :tabnew<CR>:term<CR>         " Open a new tab with terminal
nnoremap <leader>st :split<CR>:term<CR>         " Open a horizontal split with terminal
nnoremap <leader>vt :vsplit<CR>:term<CR>        " Open a vertical split with terminal

" Move elements in an array or remove or add them simply with a few key strokes
" Allow numbers to move multiple
" <?num?> + <Space> + h : Move element left
" <?num?> + <Space> + l : Move element right
" *<?num?> + <Space> + h : Remove left most element
" *<?num?> + <Space> + h : Remove right most element
" *<?num?> + <Space> + h : Add left most element
" *<?num?> + <Space> + h : Add right most element
" This is very buggy improve and use text objects
" Cannot move the first word right and last word left like this. Also cant
" move second word into the first one and vice versa
" When on second word and trying to move it left it gets deleted?
" ['word1', 'word2', 'word3', 'word 4', word5, 'word6', 'word7']
" di - delete item, df - delete first, dl - delete last
nnoremap <space>l T,df,f,p
nnoremap <space>h T,df,F,;p

" Maybe give an option as which closing or ending brackets we need to use? Like change surrounding.
nnoremap <space>dl t)F,dt)
nnoremap <space>df T(df,x

" Adding two seperate mappings for [ for first and last change
nnoremap <space>gl F,dt,t)p " similar for ]
nnoremap <space>gh T,df,F[,p " need to fix this


" How to escape [ or catch it. This doesnt seem to work!
nnoremap <space>b /,\|\[<CR>
" nnoremap <space>w /\%Vword<CR>
" nnoremap <space>b /\%V,\|\[<CR>

" allow this only for markdown files and make this into a snippet
" To add a ----- or ===== line underneath a heading in markdown.
nnoremap <space>- yypVr-<Esc>
nnoremap <space>= yypVr=<Esc>


function! FindItem(query)
    execute 'normal! /'. a:query ."\<cr>"
    let @/ = a:query
endfunction

" Todo Item states:
"   Should be like jira where its a graph of all the states and the states it can transition to
"   . -> - -> x -> X -> ^ -> ? -> /
"   Think of better ways to do this.

let states = ['-', 'x', 'X', '^', '?', '/']
" Create a graph for this and follow that for going to new states.
nnoremap <space>sp 0t]r:states[0]<CR>d

nnoremap <space>nn 0t]rx
" Mark the todo item to its NEXT state
nnoremap <space>ns 0t]rxddmm:call FindItem('## Completed')<CR>jp`m

" Mark the todo item to its PREVIOUS state

" Mark the todo item with the given state

" Add a new todo item below in normal mode
nnoremap <space>t o- [.] 

" Convert current checkpoint into a todo item (- xxx -> - [.] xxx)
nnoremap <space>st $T-i [.]<Esc>


" <S-CR>(Shift Enter) = ^[OM
" <C-CR>(Ctrl Enter) = ^[VM
autocmd FileType markdown inoremap ^[OM <CR>- [.]
autocmd FileType markdown inoremap ^[VM <Esc>O- [.]

" Move todo item when finished to completed
nnoremap <space>c dd:call FindItem('## Completed')<CR>jp


" Surround checkpoint with ys$* for markdown

"Paste in link to make it into a markdown link immediately

" Open current file in default app
nnoremap <leader>o :!open %<CR>

" ========= Folds ========= 

" Fold toggle shortcut with tab
nnoremap <Tab> za

" Saving folds upon closing vim sessions
" https://til.hashrocket.com/posts/17c44eda91-persistent-folds-between-vim-sessions
augroup AutoSaveFolds
  autocmd!
  " view files are about 500 bytes
  " bufleave but not bufwinleave captures closing 2nd tab
  " nested is needed by bufwrite* (if triggered via other autocmd)
  " https://vi.stackexchange.com/questions/13864/bufwinleave-mkview-with-unnamed-file-error-32
  " DO NOT USE SPACES BETWEEN BufWinLeave and BufLeave
  autocmd BufWinLeave,BufLeave,BufWritePost ?* nested silent! mkview!
  autocmd BufWinEnter ?* silent! loadview
augroup END

set viewoptions=folds,cursor
set sessionoptions=folds
" ========================= 

" Vim Latex preview
au FileType tex nnoremap <space>p :LLPStartPreview<CR>

" LaTex shortcuts
" Using nmap instead of nnoremap to use inbuilt plugin
" https://vi.stackexchange.com/questions/15267/mapping-using-tpope-vim-surround-only-works-with-command
" Obsolete because of inbuilt custom surround mapping
au FileType tex nmap <leader>e ysiW}i\emph<Esc>

" Convert x/y form to \cfrac{x}{y} in latex

" REMOVE ADDITIONAL SPACES IN A LINE
nnoremap <leader><leader>s :s/\s\+/ /g<CR>
" SAME CAN BE DONE FOR MULTIPLE LINES DONT KNOW HOW

" mapping to add __init__ == '__main__' in python
au FileType python nnoremap <leader>m Go<CR><CR><BS>if __init__ == '__main__':<CR>
