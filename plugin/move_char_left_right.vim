" Reload guard {{{
if &compatible || exists("g:loaded_move_char_left_right")
    finish
endif
let g:loaded_move_char_left_right = 1
" }}}

" force reload autoloading hack {{{
" call move_char_left_right#Baaad()
" }}}

" Plug mappings {{{
nnoremap <silent><expr> <Plug>(move-char-left) move_char_left_right#MoveCharLeft()
nnoremap <silent><expr> <Plug>(move-char-right) move_char_left_right#MoveCharRight()
" }}}

" suggested mappings {{{
" nmap [ä <Plug>(move-char-left)
" nmap ]ä <Plug>(move-char-right)
" }}}


