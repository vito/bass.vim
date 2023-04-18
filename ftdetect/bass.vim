" detect from filename
autocmd BufNewFile,BufRead *.bass setlocal filetype=bass

" lock files
autocmd BufNewFile,BufRead bass.lock setlocal filetype=json

" detect from shebang line
autocmd BufRead *
            \ if getline(1) =~# '\v^#!%(\f*/|/usr/bin/env\s*<)bass>' || getline(1) =~# '^# syntax = basslang' |
            \     setlocal filetype=bass |
            \ endif

" vim:sts=2:sw=2:ts=2:noet
