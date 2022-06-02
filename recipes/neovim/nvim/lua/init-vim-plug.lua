vim.cmd([[
    call plug#begin(stdpath('data') . '/plugged')
    Plug 'bronson/vim-trailing-whitespace'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'neovim/nvim-lspconfig'
    Plug 'tpope/vim-surround'
    call plug#end()
]])
