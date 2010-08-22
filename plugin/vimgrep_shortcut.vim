" vim:set ts=4 sts=4 sw=4 fdm=marker:

function VimGrepShortcut(...)
    " カーソルの下のモジュール文字列を取得
    let search_text = expand("<cword>")
    let search_path_top = "**/*"

    if exists("g:vimgrep_path_top")
        search_path_top = g:vimgrep_path_top
    endif

    if exists("a:1")
        search_text = a:1
        if exists("a:2")
            search_path_top = a:2
        endif
    endif
    silent! execute 'tab vimgrep /' . search_text . '/ ' . search_path_top . ' | cwindow'
endfunction

command VGS call VimGrepShortcut()
