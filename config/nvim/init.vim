if &compatible
    set nocompatible
endif

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
    call dein#begin('~/.cache/dein')
    
    call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

"[auto complete based on ncm2]
    call dein#add('~/.cache/dein/repos/github.com/roxma/nvim-yarp')
    call dein#add('~/.cache/dein/repos/github.com/ncm2/ncm2')
    call dein#add('~/.cache/dein/repos/github.com/ncm2/ncm2-path')
    call dein#add('~/.cache/dein/repos/github.com/ncm2/ncm2-bufword')
    call dein#add('~/.cache/dein/repos/github.com/ncm2/ncm2-jedi')
    call dein#add('~/.cache/dein/repos/github.com/Shougo/neco-syntax')
    call dein#add('~/.cache/dein/repos/github.com/ncm2/ncm2-syntax')
    call dein#add('~/.cache/dein/repos/github.com/Shougo/neco-vim')
    call dein#add('~/.cache/dein/repos/github.com/ncm2/ncm2-vim')
    call dein#add('~/.cache/dein/repos/github.com/Shougo/neosnippet-snippets')
    call dein#add('~/.cache/dein/repos/github.com/Shougo/neosnippet.vim')
    call dein#add('~/.cache/dein/repos/github.com/ncm2/ncm2-neosnippet')
    call dein#add('~/.cache/dein/repos/github.com/ncm2/ncm2-highprio-pop')

"[file explorer based on defx.nvim]
    call dein#add('~/.cache/dein/repos/github.com/Shougo/defx.nvim')

"[color themes]
    call dein#add('~/.cache/dein/repos/github.com/morhetz/gruvbox')
    
    call dein#end()
    call dein#save_state()
endif

"[user settings]
set number

"[key maps]
"[@summary use 'F2' to open defx]
map <silent> <F2> :Defx<cr>
imap <silent> <F2> <Esc>:Defx<cr>i

"[auto complete]
"[[ncm2 setting]]
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone
"[[neosnippet setting]]
"[@summary use 'ctrl-k' to expand a snippet and use 'tab' to jump inside it]
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
imap <expr><TAB>
\ pumvisible() ? "\<C-n>" :
\ neosnippet#expandable_or_jumpable() ?
\     "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

"[gui options]
call rpcnotify(0, 'Gui', 'Option', 'Popupmenu', 0)
call rpcnotify(0, 'Gui', 'Option', 'Tabline', 0)
call rpcnotify(0, 'Gui', 'Font', 'DejaVu Sans Mono:h15', 0)

"[color schemes]
"colorscheme desert
colorscheme gruvbox
set background=dark
"set background=light

"[defx]
call defx#custom#option('_', {
    \ 'winwidth': 20,
    \ 'split': 'vertical',
    \ 'direction': 'topleft',
    \ 'show_ignored_files': 0,
    \ 'buffer_name': '',
    \ 'toggle': 1,
    \ 'resume': 1
    \ })

autocmd FileType defx call s:defx_user_settings()
function! s:defx_user_settings() abort
nnoremap <silent><buffer><expr> <cr>
\ defx#do_action('open')
nnoremap <silent><buffer><expr> c
\ defx#do_action('copy')
nnoremap <silent><buffer><expr> m 
\ defx#do_action('move')
nnoremap <silent><buffer><expr> p
endfunction

filetype plugin indent on
syntax enable
