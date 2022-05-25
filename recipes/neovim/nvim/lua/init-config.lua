vim.g.mapleader = ' '
vim.cmd('filetype plugin indent on')
vim.cmd('highlight clear SignColumn')
vim.cmd('highlight Pmenu ctermfg=NONE ctermbg=236 cterm=NONE guifg=NONE guibg=#64666d gui=NONE')
vim.cmd('highlight PmenuSel ctermfg=NONE ctermbg=24 cterm=NONE guifg=NONE guibg=#204a86 gui=NONE')
vim.cmd('autocmd CompleteDone * pclose')

local map = vim.api.nvim_set_keymap

map('', '<Up>', '', {})
map('', '<Down>', '', {})
map('', '<Left>', '', {})
map('', '<Right>', '', {})

map('i', '<Up>', '', {})
map('i', '<Down>', '', {})
map('i', '<Left>', '', {})
map('i', '<Right>', '', {})

map('', '<F1>', '', {})
map('i', '<F1>', '', {})

map('', '<C-h>', ':vertical resize -1<CR>', { silent = true })
map('', '<C-j>', ':resize +1<CR>', { silent = true })
map('', '<C-k>', ':resize -1<CR>', { silent = true })
map('', '<C-l>', ':vertical resize +1<CR>', { silent = true })

map('', '<leader>f', ':FZF<CR>', {})
map('', '<leader>b', ':Buffers<CR>', {})

map('', '<M-h>', ':TmuxNavigateLeft<CR>', { silent = true })
map('', '<M-j>', ':TmuxNavigateDown<CR>', { silent = true })
map('', '<M-k>', ':TmuxNavigateUp<CR>', { silent = true })
map('', '<M-l>', ':TmuxNavigateRight<CR>', { silent = true })

vim.cmd('inoremap <expr> <C-j> pumvisible() ? "<C-n>" : "<C-x><C-o>"')
vim.cmd('inoremap <expr> <C-k> pumvisible() ? "<C-p>" : "<C-x><C-o>"')

vim.go.clipboard = 'unnamed,unnamedplus'
vim.go.ignorecase = true
vim.go.incsearch = true
vim.go.pumheight = 10
vim.go.scrolloff = 5
vim.go.shiftround = true
vim.go.smartcase = true
vim.go.termguicolors = true
vim.go.undodir = '/tmp'
vim.go.updatetime = 400
vim.go.wrapscan = false

vim.wo.cursorline = true
vim.wo.signcolumn = 'number'
vim.wo.wrap = false

vim.bo.expandtab = true
vim.bo.shiftwidth = 4
vim.bo.smartindent = true
vim.bo.softtabstop = 4
vim.bo.swapfile = false
vim.bo.tabstop = 4
vim.bo.textwidth = 100
vim.bo.undofile = true
