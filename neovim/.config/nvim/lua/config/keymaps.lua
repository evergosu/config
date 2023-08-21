local map = require('config.manager').map

-- Unmap <space> to use as leader key.
map({ 'n', 'v' }, '<space>', '<nop>', { silent = true })

-- Emulate <esc> with movement.
map('i', 'kj', '<esc>', { silent = true })

map({ 'i', 'v', 'n', 's' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'save file' })
map('n', '<leader>i', vim.show_pos, { desc = 'inspector' })

-- Better copy-paste and deletion.
map('n', 'x', '"_x', { desc = 'delete into void' })
map('v', 'p', '"_dP', { desc = 'paste into void' })
map('n', '<leader>d', '"_d', { desc = 'delete into void' })
map('v', '<leader>d', '"_d', { desc = 'delete into void' })
map('n', '<leader>y', '"+y', { desc = 'yank into system' })
map('v', '<leader>y', '"+y', { desc = 'yank into system' })
map('n', '<leader>p', '"+p', { desc = 'paste from system' })
map('v', '<leader>p', '"+p', { desc = 'paste from system' })

-- Replace by word without lsp.
vim.keymap.set('n', '<leader>sr', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'replace word' })

-- Better up/down.
map({ 'n', 'x' }, 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ 'n', 'x' }, 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Better indenting.
map('v', '<', '<gv')
map('v', '>', '>gv')

-- Clear search with <esc>.
map({ 'i', 'n' }, '<esc>', '<cmd>noh<cr><esc>', { desc = 'escape and clear hlsearch' })

-- Clear search, diff update and redraw.
map('n', '<leader>r', '<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>', { desc = 'redraw' })

-- Move lines.
map('v', '<S-j>', ":m '>+1<cr>gv=gv", { desc = 'move down' })
map('v', '<S-k>', ":m '<-2<cr>gv=gv", { desc = 'move up' })

-- Resize window.
map('n', '<C-Up>', '<cmd>resize +2<cr>', { desc = 'increase window height' })
map('n', '<C-Down>', '<cmd>resize -2<cr>', { desc = 'decrease window height' })
map('n', '<C-Left>', '<cmd>vertical resize -2<cr>', { desc = 'decrease window width' })
map('n', '<C-Right>', '<cmd>vertical resize +2<cr>', { desc = 'increase window width' })

-- Move to window.
map('n', '<C-h>', '<C-w>w', { desc = 'hop to next window', remap = true })
map('n', '<C-l>', '<C-w>p', { desc = 'hop to last window', remap = true })

-- Center scrolls.
map('n', '<C-d>', '<C-d>zz', { desc = 'scroll down and center' })
map('n', '<C-u>', '<C-u>zz', { desc = 'scroll up and center' })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map('n', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'next search result' })
map('x', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'next search result' })
map('o', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'next search result' })
map('n', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'prev search result' })
map('x', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'prev search result' })
map('o', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'prev search result' })

-- Lazy plugin manager.
map('n', '<leader>L', '<cmd>Lazy<cr>', { desc = 'lazy' })

-- Buffers.
map('n', '<S-h>', '<cmd>:bnext<cr>', { desc = 'hop to next buffer' })
map('n', '<S-l>', '<cmd>e #<cr>', { desc = 'hop to last buffer' })
map('n', '<leader>c', [[<cmd>:%bd|e#|bd#<cr>|'"]], { desc = 'close all buffers' })

-- Quickfix and Loclist navigation.
map('n', '<C-j>', '<cmd>cnext<cr>zz', { desc = 'next in quickfix' })
map('n', '<C-k>', '<cmd>cprev<cr>zz', { desc = 'prev in quickfix' })
map('n', '<leader>j', '<cmd>lnext<cr>zz', { desc = 'next in loclist' })
map('n', '<leader>k', '<cmd>lprev<cr>zz', { desc = 'prev in loclist' })
