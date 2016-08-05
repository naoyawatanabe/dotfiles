" --------------------------------
" Basic Settings
" --------------------------------
syntax on
set vb t_vb=
set nobackup
set ignorecase
set laststatus=2
set statusline=%F\ [ROW=%l/%L]\ [ENC=%{&fileencoding}]
set number
set noswapfile
set ruler
set wrap
set whichwrap=b,s,h,l,<,>,[,],~

" --------------------------------
" tab expand
" --------------------------------
set expandtab
set autoindent
set tabstop=2
set shiftwidth=2
set softtabstop=2

" --------------------------------
" about Encodings
" --------------------------------
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8

" --------------------------------
" Vundle
" --------------------------------
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
Bundle 'Shougo/neocomplcache'
Bundle 'tpope/vim-endwise'
Bundle 'scrooloose/nerdtree'
Bundle 'altercation/vim-colors-solarized'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'tpope/vim-rails'
Bundle 'tomtom/tcomment_vim'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'Shougo/neosnippet'
Bundle 'Shougo/neosnippet-snippets'
Bundle 'slim-template/vim-slim.git'
Bundle 'kien/ctrlp.vim'
Bundle 'kchmck/vim-coffee-script'

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

" --------------------------------
" Solarized
" --------------------------------
syntax enable
set background=dark
colorscheme solarized

" --------------------------------
" neocomplcache
" --------------------------------
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
    \ }

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" --------------------------------
" Snippets
" --------------------------------
autocmd User Rails.view*                 NeoSnippetSource '~/.vim/snippet/ruby.rails.view.snip'
autocmd User Rails.controller*           NeoSnippetSource '~/.vim/snippet/ruby.rails.controller.snip'
autocmd User Rails/db/migrate/*          NeoSnippetSource '~/.vim/snippet/ruby.rails.migrate.snip'
autocmd User Rails/config/routes.rb      NeoSnippetSource '~/.vim/snippet/ruby.rails.route.snip'



let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files --cached --others --exclude-standard'] " speedup
