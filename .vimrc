
"" Default Action Key Bind
:noremap k gk
:noremap j gj
:noremap gk k
:noremap gj j :noremap <Down> gj
:noremap <Up> gk
"" vimrc Edit Key Bind
:nnoremap ,ev :tabnew $HOME/.vimrc<CR>
:nnoremap ,rv :source $HOME/.vimrc<CR>

"" Format
:set number
:set cursorline
:set list
:set listchars=eol:<,tab:▸\ 
:set tabstop=2
:set shiftwidth=2
:set scrolloff=20

"" NeoBundle Setup
set nocompatible
filetype off

if has('vim_starting')
   set runtimepath+=~/.vim/bundle/neobundle.vim/
   call neobundle#rc(expand('~/.vim/bundle/'))
 endif

"" Install Plugin For NeoBUndle
NeoBundle 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc'
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'

"" Unite
NeoBundle 'Shougo/unite.vim'

let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200

nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q

NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/vimfiler'

"" NeoComplcashe
NeoBundle 'Shougo/neocomplcache'
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

NeoBundle 'Shougo/neosnippet'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'tomasr/molokai'
NeoBundle 'fugalh/desert.vim'
NeoBundle 'tpope/vim-markdown'


NeoBundle 'thinca/vim-quickrun'

let g:quickrun_config = {}
let g:quickrun_config['markdown'] = {
	\ 'outputter':'browser'
	\ }

NeoBundle 'tyru/open-browser.vim'

filetype plugin on
filetype indent on

" カラースキーム適用
:colorscheme desert

