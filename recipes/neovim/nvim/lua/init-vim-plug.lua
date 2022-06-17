vim.cmd([[
    call plug#begin(stdpath('data') . '/plugged')
    Plug 'bronson/vim-trailing-whitespace'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'tpope/vim-surround'
    Plug 'windwp/nvim-autopairs'
    call plug#end()
]])
