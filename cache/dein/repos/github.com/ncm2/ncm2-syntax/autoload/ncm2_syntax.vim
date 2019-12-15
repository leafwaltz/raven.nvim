"=============================================================================
" FILE: ncm2_syntax.vim
" AUTHOR:  Jia Sui <jsfaint@gmail.com>
" License: MIT license
"=============================================================================

if get(s:, 'loaded', 0)
    finish
endif
let s:loaded = 1

let s:initialized = 0

function! ncm2_syntax#on_complete(ctx) abort
  if !s:initialized
    call necosyntax#initialize()
    let s:initialized = 1
  endif

  let matches = necosyntax#gather_candidates()

  call ncm2#complete(a:ctx, a:ctx['startccol'], matches)
endfunction

function! ncm2_syntax#init() abort
  call ncm2#register_source({ 'name': 'syntax',
        \ 'mark': 'syntax',
        \ 'priority': 8,
        \ 'on_complete': 'ncm2_syntax#on_complete',
        \ })
endfunction
