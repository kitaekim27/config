let g:airline_powerline_fonts = 1
let g:airline_theme='deus'
let g:tmux_navigator_no_mappings = 1 " Change tmux navigator's keys manually.

call plug#begin(stdpath('data') . '/plugged')
Plug 'Yggdroot/indentLine'
Plug 'bronson/vim-trailing-whitespace'
Plug 'christoomey/vim-tmux-navigator'
Plug 'dart-lang/dart-vim-plugin'
Plug 'edkolev/tmuxline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

nnoremap <Space> <NOP>
let mapleader = ' '

nmap <Up>    <NOP>
imap <Up>    <NOP>
nmap <Down>  <NOP>
imap <Down>  <NOP>
nmap <Left>  <NOP>
imap <Left>  <NOP>
nmap <Right> <NOP>
imap <Right> <NOP>

" Disable <F1> key to prevent help page opens up accidentally.
noremap  <F1> <NOP>
inoremap <F1> <NOP>

" Mapping to resize window split.
noremap <silent> <C-h> :vertical resize -1<CR>
noremap <silent> <C-j> :resize +1<CR>
noremap <silent> <C-k> :resize -1<CR>
noremap <silent> <C-l> :vertical resize +1<CR>

" Find a file under current working directory.
noremap <leader>f :FZF<CR>
" Find a buffer.
noremap <leader>b :Buffers<CR>

nnoremap <silent> <M-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <M-l> :TmuxNavigateRight<CR>
nnoremap <silent> <M-k> :TmuxNavigateUp<CR>
nnoremap <silent> <M-j> :TmuxNavigateDown<CR>

" Searching configurations.
set ignorecase
set incsearch
set nowrapscan
set smartcase

" Editor configurations.
set nowrap
set noswapfile
set scrolloff=5
set textwidth=100
set clipboard=unnamed,unnamedplus " Use system clipboard.
set undodir="/tmp"
set undofile

" Display configurations.
set cursorline
set termguicolors
set background=dark
set pumheight=10
hi clear SignColumn " Use terminal color scheme for SignColumn.
" Popup menu color configurations.
hi Pmenu ctermfg=NONE ctermbg=236 cterm=NONE guifg=NONE guibg=#64666d gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=24 cterm=NONE guifg=NONE guibg=#204a86 gui=NONE

" Indentation configurations.
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set shiftround

autocmd Filetype sh setlocal
	\ tabstop=4
	\ softtabstop=4
	\ shiftwidth=4
	\ expandtab
	\ smartindent

autocmd Filetype asm setlocal
	\ tabstop=4
	\ softtabstop=4
	\ shiftwidth=4
	\ expandtab
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

autocmd Filetype python setlocal
	\ tabstop=4
	\ softtabstop=4
	\ shiftwidth=4
	\ expandtab
	\ smartindent

autocmd Filetype javascript setlocal
	\ tabstop=4
	\ softtabstop=4
	\ shiftwidth=4
	\ expandtab
	\ smartindent

autocmd Filetype html setlocal
	\ tabstop=2
	\ softtabstop=2
	\ shiftwidth=2
	\ expandtab
	\ smartindent

autocmd Filetype css setlocal
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

autocmd BufRead,BufNewFile ~/workspace/linux/** setlocal
	\ tabstop=8
	\ softtabstop=8
	\ shiftwidth=8
	\ noexpandtab
	\ cindent

autocmd BufRead,BufNewFile ~/workspace/gnu/** setlocal
	\ tabstop=2
	\ softtabstop=2
	\ shiftwidth=2
	\ expandtab
	\ textwidth=79
	\ cinoptions=>4,n-2,{2,^-2,:2,=2,g0,h2,p5,t0,+2,(0,u0,w1,m1
	\ cindent

