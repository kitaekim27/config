let g:tmux_navigator_no_mappings = 1 " Change tmux navigator's keys manually.

call plug#begin(stdpath('data') . '/plugged')
Plug 'Yggdroot/indentLine'
Plug 'bronson/vim-trailing-whitespace'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

nnoremap <Space> <NOP>
let mapleader = ' '

" Disable arraw keys.
map <Up> <NOP>
map <Down> <NOP>
map <Left> <NOP>
map <Right> <NOP>

" Disable <F1> key to prevent help page opens up accidentally.
noremap <F1> <NOP>
inoremap <F1> <NOP>

" Mapping to resize window split.
noremap <silent> <C-h> :vertical resize -2<CR>
noremap <silent> <C-l> :vertical resize +2<CR>
noremap <silent> <C-k> :resize -2<CR>
noremap <silent> <C-j> :resize +2<CR>

" Find a file under current working directory.
noremap <leader>f :FZF<CR>
" Find a buffer.
noremap <leader>b :Buffers<CR>

nnoremap <silent> <M-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <M-l> :TmuxNavigateRight<CR>
nnoremap <silent> <M-k> :TmuxNavigateUp<CR>
nnoremap <silent> <M-j> :TmuxNavigateDown<CR>

" Searching configuration.
set smartcase
set ignorecase
set incsearch
set nowrapscan

" Editting configurations.
set nowrap
set noswapfile
set scrolloff=5
set textwidth=100
set clipboard=unnamed,unnamedplus " Use system clipboard.
set undodir="/tmp"
set undofile

" Display configurations.
" set number
set cursorline
set termguicolors
set background=dark
set pumheight=10
hi clear SignColumn " Use system color scheme for SignColumn.
" Popup menu color configurations.
hi Pmenu ctermfg=NONE ctermbg=236 cterm=NONE guifg=NONE guibg=#64666d gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=24 cterm=NONE guifg=NONE guibg=#204a86 gui=NONE

" Default indentation configuration.
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set shiftround

" Language specific indentation configurations.
autocmd Filetype sh setlocal
	\ tabstop=2
	\ softtabstop=2
	\ shiftwidth=2
	\ noexpandtab
	\ smartindent
autocmd Filetype asm setlocal
	\ tabstop=2
	\ softtabstop=2
	\ shiftwidth=2
	\ noexpandtab
	\ cindent
autocmd Filetype c setlocal
	\ tabstop=4
	\ softtabstop=4
	\ shiftwidth=4
	\ expandtab
	\ cindent
autocmd Filetype make setlocal
	\ tabstop=4
	\ softtabstop=4
	\ shiftwidth=4
	\ noexpandtab
	\ smartindent
autocmd Filetype cpp setlocal
	\ tabstop=4
	\ softtabstop=4
	\ shiftwidth=4
	\ expandtab
	\ cindent
autocmd Filetype python,javascript setlocal
	\ tabstop=4
	\ softtabstop=4
	\ shiftwidth=4
	\ expandtab
	\ smartindent
autocmd Filetype html,css setlocal
	\ tabstop=2
	\ softtabstop=2
	\ shiftwidth=2
	\ expandtab
	\ smartindent
autocmd Filetype java setlocal
	\ tabstop=4
	\ softtabstop=4
	\ shiftwidth=4
	\ expandtab
	\ cindent
autocmd Filetype xml setlocal
	\ tabstop=2
	\ softtabstop=2
	\ shiftwidth=2
	\ noexpandtab
	\ smartindent

" Linux coding style.
autocmd BufRead,BufNewFile ~/Desktop/gnu/** setlocal
	\ tabstop=8
	\ softtabstop=8
	\ shiftwidth=8
	\ noexpandtab
	\ cindent

" GNU coding style.
autocmd BufRead,BufNewFile ~/Desktop/gnu/** setlocal
	\ tabstop=2
	\ softtabstop=2
	\ shiftwidth=2
	\ expandtab
	\ textwidth=79
	\ cinoptions=>4,n-2,{2,^-2,:2,=2,g0,h2,p5,t0,+2,(0,u0,w1,m1
	\ cindent
