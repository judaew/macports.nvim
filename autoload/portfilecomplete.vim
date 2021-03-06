" See  https://vi.stackexchange.com/a/4585

let s:matches = g:macports_completefunc_keywords

function! portfilecomplete#CompleteFA(findstart, base)
    if a:findstart
        " locate the start of the word
        let line = getline('.')
        let start = col('.') - 2
        while start > 0 && (line[start - 1] =~ '\a')
            let start -= 1
        endwhile
        return start
    else
        " find classes matching "a:base"
        let res = []
        for m in split(s:matches)
            if m =~ a:base
                call add(res, m)
            endif
        endfor
        return res
    endif
endfun
