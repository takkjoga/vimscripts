" vim:set ts=4 sts=4 sw=4 fdm=marker:

function PerlModuleFileOpen(...)
    " 「:」を文字列として認識させる
    setlocal iskeyword+=58
    " カーソルの下のモジュール文字列を取得
    let module = expand("<cword>")
    if len(module)
        if !exists("g:perl_module_path")
            let g:perl_module_path = "~"
        endif
        let s:path = g:perl_module_path . '/' . substitute(module, '::', '/',
        'g') . '.pm'
        echo s:path

        if exists("a:1")
            if a:1 == 'h'
                silent! execute 'split ' . s:path
            elseif a:1 == 'v'
                silent! execute 'vsplit ' . s:path
            elseif a:1 == 't'
                silent! execute 'tabnew ' . s:path
            else
                silent! execute 'edit ' . s:path
            endif
        else
            silent! execute 'edit ' . s:path
        endif
    endif
    setlocal iskeyword-=58
endfunction

command PerlModuleFileOpen call PerlModuleFileOpen()
