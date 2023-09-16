function! move_char_left_right#MoveCharLeft()
    function! s:inner(...) closure abort
        if virtcol('.') > 1
            let old_ve = &virtualedit
            " needed for correct handling if cursor is at the end of the line
            " also has implications for multi-position characters such as tabs
            set virtualedit=all
            let save_z = getreg("z")
            let save_z_type = getregtype("z")
            let steps = min([v:count1, virtcol('.') - 1])
            execute 'normal! "zx' . repeat('h',steps) . '"zP'
            call setreg("z", save_z, save_z_type)
            let &virtualedit = old_ve
        endif
    endfunction
    let &opfunc=get(funcref('s:inner'), 'name')
    return 'g@l'
endfunction

function! move_char_left_right#MoveCharRight()
    function! s:inner(...) closure abort
        if virtcol('.') < virtcol('$')-1
            let old_ve = &virtualedit
            " changes handling over multi-position characters such as tabs
            set virtualedit=all
            let save_z = getreg("z")
            let save_z_type = getregtype("z")
            let steps = min([v:count - 1, strdisplaywidth(getline('.')) - virtcol('.') - 1])
            execute 'normal! "zx' . repeat('l',steps) . '"zp'
            call setreg("z", save_z, save_z_type)
            let &virtualedit = old_ve
        end
    endfunction
    let &opfunc=get(funcref('s:inner'), 'name')
    return 'g@l'
endfunction
