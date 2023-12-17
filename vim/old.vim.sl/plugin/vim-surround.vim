
"-------------------------------------------------------------------------------
" Vim Surround Configuration
"-------------------------------------------------------------------------------

" Usage: ysiw e/l
" Text: lalala
" Command: ysiw e -> textbf
" Final: \textbf{lalala}
" Try: `:echo char2nr("e")` or `:echo nr2char(108)`

au FileType tex let g:surround_108 = "\\begin{\1environment: \1}\r\\end{\1\1}" " 108 -> l
au FileType tex let g:surround_{char2nr('e')} = "\\\1effect: \1{\r}"  " surround text by \emph or \textbf where emph is the effect

