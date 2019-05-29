
"-------------------------------------------------------------------------------
" Vim Surround Configuration
"-------------------------------------------------------------------------------

au FileType tex let g:surround_108 = "\\begin{\1environment: \1}\r\\end{\1\1}"
au FileType tex let g:surround_{char2nr('e')} = "\\\1effect: \1{\r}"  " surround text by \emph or \textbf where emph is the effect

