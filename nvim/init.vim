"Plugins (vim-plug)
call plug#begin()

" gui
Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'doums/darcula'

" files
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" lang
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'

" Plug 'simrat39/rust-tools.nvim'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'ray-x/lsp_signature.nvim'

" Snippet engine
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-vsnip'

Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'
Plug 'rust-lang/rust.vim'
Plug 'plasticboy/vim-markdown'

" editor
Plug 'tpope/vim-commentary'

call plug#end()

" LSP config
source ~/.config/nvim/lsp.vim

" Enable type inlay hints
autocmd CursorHold,CursorHoldI *.rs :lua require'lsp_extensions'.inlay_hints{ only_current_line = true }

" Gui settings
syntax on
set number
set relativenumber
set colorcolumn=80
set noshowmode
set termguicolors

" transpartent background ignoring theme 
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
colorscheme darcula

let g:lightline = { 'colorscheme': 'darculaOriginal' }

" Editor Settings
let mapleader=","
set autoindent
set nowrap
set nojoinspaces
set splitright
set splitbelow
set mouse=a
set signcolumn=yes
set clipboard+=unnamed

" Jump to start and end of line using the home row keys
map H ^
map L $

" Search
set incsearch
set ignorecase
set smartcase
set gdefault

" Close delimiters
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>

" Search usign Rg
noremap <leader>s :Rg
let g:fzf_layout = { 'down': '~20%' }
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>),
  \   1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" Open files using fzf
noremap <leader>o :Files<Cr>
noremap <leader>p :Files!<Cr>
noremap <leader>h :History<Cr>

function! s:list_cmd()
  let base = fnamemodify(expand('%'), ':h:.:S')
  return base == '.' ? 'fd --type file --follow' : printf('fd --type file --follow | proximity-sort %s', shellescape(expand('%')))
endfunction

function! s:opts_cmd()
	return {'source': s:list_cmd(), 'options': '--tiebreak=index'}
endfunction

command! -bang -nargs=? -complete=dir Files
			\ call fzf#vim#files(<q-args>, <bang>0 ? fzf#vim#with_preview(s:opts_cmd(), 'up:60%') : s:opts_cmd(), <bang>0)

" Open buffer list
noremap <leader>b :Buffers<Cr>

" Open new file adjacent to current file
nnoremap <leader>n :e <C-R>=expand("%:p:h") . "/" <CR>

" Rust config
au FileType rust source ~/.config/nvim/rust.vim

" Remap split bindings
nnoremap <C-w>v <C-w>s
nnoremap <C-w>s <C-w>v

nnoremap <C-w><C-v> <C-w>s
nnoremap <C-w><C-s> <C-w>v

" Rebing escape
set timeoutlen=200
inoremap ii <Esc>
