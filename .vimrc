set relativenumber
set number
set linebreak

set ignorecase
set smartcase
set incsearch

set mouse=a

" Tabs are 4 spaces
set expandtab
set ts=4 sw=4

map <space> <leader>

" Greatest Rebind of all time
inoremap <C-c> <Esc>


" Pane Navigation

nnoremap <C-h> <C-w>h 
nnoremap <C-j> <C-w>j 
nnoremap <C-k> <C-w>k 
nnoremap <C-l> <C-w>l 

" Window Managment
nnoremap <leader>sv :vsplit<CR>
nnoremap <leader>sh :split<CR>
nnoremap <leader>st :terminal<CR>


" Persistent Undos
set undofile                " Save undos after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo


" Toggle Transparent
let t:is_transparent = 0
function! Toggle_transparent()
	if t:is_transparent == 0
		hi Normal guibg=NONE ctermbg=NONE
		let t:is_transparent = 1
	else
		set background=dark
		let t:is_transparent = 0
	endif
endfunction

"" Plugin Configuartion

" FZF
nnoremap <leader>ff :FZF<CR>

" asynccomplete

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

" Emmet CONFIG
au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#emmet#get_source_options({
    \ 'name': 'emmet',
    \ 'whitelist': ['html'],
    \ 'completor': function('asyncomplete#sources#emmet#completor'),
    \ }))


" Plugin Management/Installation

call plug#begin()

Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'prabirshrestha/asyncomplete-emmet.vim'
Plug 'mattn/emmet-vim'

Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'

Plug 'joshdick/onedark.vim'



call plug#end()

syntax on
let g:onedark_termcolors=256
let g:onedark_terminal_italics=1
colorscheme onedark

if t:is_transparent == 0
	call Toggle_transparent()
endif


" LSP setup that I don't understand, copy pasted script kitty time.
if executable('pylsp')
    " pip install python-lsp-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pylsp',
        \ 'cmd': {server_info->['pylsp']},
        \ 'allowlist': ['python'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
    
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
