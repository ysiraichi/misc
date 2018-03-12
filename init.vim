let g:python_host_skip_check=1
let g:python3_host_skip_check=1
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'

let mapleader = ","

" VimPlug Plugins
let g:runtimepath = '/home/yukio/.config/nvim/bundle'
call plug#begin(g:runtimepath)

Plug '~/workspace/nvim-plugins/tanjun'
Plug '~/workspace/nvim-plugins/soredake'
Plug '~/workspace/nvim-plugins/kosokutex'

" Plug 'bling/vim-bufferline'
" Plug 'Valloric/YouCompleteMe'
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Plug 'bling/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'tpope/vim-fugitive'

" Plug 'lervag/vimtex'
" Plug 'rust-lang/rust.vim'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

call plug#end()

"
" ===========================================================================================
" VimPlug managed plugins
" ===========================================================================================
"

" tanjun
" let g:tanjun_enable = 0

"
" ===========================================================================================
" Old vimrc configs.
" ===========================================================================================
"

" Colorscheme
set t_Co=256
colorscheme default
set mouse=c

" Filetype commands
filetype on
filetype plugin on
filetype indent on
syntax enable

" Folding
set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set foldlevel=2

" Tab commands
set tabstop=4
set softtabstop=4
set shiftwidth=4

set expandtab
set smarttab
set autoindent

" Line number
set number
set relativenumber

" Edge column color
set colorcolumn=0

set hidden

"
" ===========================================================================================
" Mostly highlighting...
" ===========================================================================================
"

" Line
set cursorline
" hi CursorLine cterm=none ctermbg=246 ctermfg=88
hi CursorLine cterm=none ctermbg=7
hi CursorLineNr cterm=bold ctermbg=232 ctermfg=255
hi LineNr ctermbg=7 ctermfg=232 cterm=None

" Matching things
hi MatchParen cterm=bold,underline ctermfg=1 ctermbg=7

" Folding
hi Folded cterm=bold ctermbg=55 ctermfg=255

" Out of text color
hi NonText ctermbg=229 ctermfg=229 cterm=None
hi NormalNC ctermbg=229

" Visual
hi Visual ctermbg=7

" Search
set hlsearch
hi Search cterm=bold ctermbg=130 ctermfg=255

" Status line
set laststatus=2
hi WildMenu ctermfg=226 ctermbg=232 guifg=Black guibg=Yellow
hi StatusLine ctermbg=226 ctermfg=232 cterm=bold
" set statusline=%F\ %y%=[\ %l/%c%V\ ]\ -\ Lines:%-16(%L(%p%%)%) 

"
" ===========================================================================================
" Goo'old mappings
" ===========================================================================================
"

" Mappings/Abbreviations
inoremap jk <Esc>
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>i

nnoremap <leader>w <Esc>:w<Cr>
nnoremap <leader>q <Esc>:q<Cr>

" Changing Splits
nnoremap <leader>j <C-w><C-j>
nnoremap <leader>k <C-w><C-k>
nnoremap <leader>l <C-w><C-l>
nnoremap <leader>h <C-w><C-h>

nnoremap <leader><Tab> :BufferChangeList<Cr>

" Terminal Splits
tnoremap jk <C-\><C-n>
tnoremap <leader>j <C-\><C-n><C-w><C-j>
tnoremap <leader>k <C-\><C-n><C-w><C-k>
tnoremap <leader>l <C-\><C-n><C-w><C-l>
tnoremap <leader>h <C-\><C-n><C-w><C-h>

nnoremap <C-t> :botright split<Cr>:terminal<Cr><C-\><C-n>:resize 20<Cr>iclear<Cr>

" Misc
nnoremap <leader>n :nohl<Cr>
