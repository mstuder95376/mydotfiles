" Mike Studer's vimrc file
"
" Last Updated Oct 2025
"
set nocompatible        " be iMproved, required
set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set mouse=a             " Enable mouse usage (all modes)
set ruler
set autoread
set noswapfile
set laststatus=2
set history=50
set autoindent
set showmode
set path+=**
set wildmenu
set t_Co=256            " Number of colors to use in vim

filetype off            " Do not detect filetype I am working with
syntax on

" Set leader key to my commands
let mapleader = "\<Space>"

" Numbers
set number
set numberwidth=6

" Scrolling
set scrolloff=8
set sidescrolloff=15
set sidescroll=1

" Indents
set tabstop=2
set shiftwidth=2
set expandtab

" Line numbering
set rnu
function! ToggleNumbersOn()
  set nu!
  set rnu
endfunction
function! ToggleRelativeOn()
  set rnu!
  set nu
endfunction

autocmd FocusLost * call ToggleNumbersOn()
autocmd FocusGained * call ToggleRelativeOn()
autocmd InsertEnter * call ToggleRelativeOn()
autocmd InsertLeave * call ToggleNumbersOn()


" Color Schemes
" colorscheme Chasing_Logic
" colorscheme darkblue
" colorscheme onedark
" colorscheme mike
" colorscheme void
colorscheme woju

" Put code comments in italics
highlight Comment cterm=italic

" Searches
set hlsearch " Search highlighting on

" Hotkey to clear search highlights
noremap <leader>c :noh <CR>

" Hotkey to remove all blank lines
noremap <leader>b :g/^$/d <CR>

" Hotkey to remove all comment lines
noremap <leader># :g/^\s*#/d <CR>

" Hotkey to remove all extra whitespaces
noremap <leader>- :FixWhitespace <CR>

" Window split direction settings
set splitbelow splitright
" Remap splits navigation to just CTRL + h or v
nnoremap <C-h> <C-w>s
nnoremap <C-v> <C-w>v
" Navigate between splits
noremap <C-k> <C-w>k<CR>"
noremap <C-j> <C-w>j<CR>"
noremap <leader>t :botright horizontal terminal<CR>

" Nerd Tree
noremap <leader>n :NERDTreeToggle <CR>
"
" Vim Buffers
noremap <leader>[ :bprev <CR>
noremap <leader>] :bnext <CR>

" Lightline
let g:lightline = {
      \ 'colorscheme': 'materia',
      \ }
set noshowmode

" LSP section
filetype plugin on
" Turn off document diagnostics so ALE can do it
let g:lsp_diagnostics_enabled = 0
" Copied (almost) directly from the vim-lsp docs:
function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif

  let g:lsp_format_sync_timeout = 1000
  autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
endfunction

augroup lsp_install
  au!
  " call s:on_lsp_buffer_enabled (set the lsp shortcuts) when an lsp server
  " is registered for a buffer.
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

