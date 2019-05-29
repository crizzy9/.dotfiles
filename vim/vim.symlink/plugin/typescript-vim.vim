" Typescript plugin settings
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''


" Autocmds
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
autocmd FileType typescript :set makeprg=tsc
