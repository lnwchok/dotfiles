-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- NOTE: Utility
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
-- vim.keymap.set('n', '<leader>gc', 'gcc', { desc = 'Toggle Comment' })

-- Select All
vim.keymap.set('n', '<C-a>', 'ggVG')

-- Delete Line w/o registered
vim.keymap.set('n', 'X', 'Vx')

vim.keymap.set('n', '<F4>', '<cmd>source %<CR>', { desc = 'Execute this file' })

vim.keymap.set('n', '<leader>L', '<cmd>Lazy<CR>')

-- NOTE: Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- terminal mode
-- vim.keymap.set('n', '<C-\\>', '<cmd>ToggleTerm<CR>', { desc = 'Open Terminal' })
-- vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
-- vim.keymap.set('t', '<C-h>', '<cmd>wincmd h<CR>')
-- vim.keymap.set('t', '<C-j>', '<cmd>wincmd j<CR>')
-- vim.keymap.set('t', '<C-k>', '<cmd>wincmd k<CR>')
-- vim.keymap.set('t', '<C-l>', '<cmd>wincmd l<CR>')

-- NOTE: Buffers
-- Resize Buffers
vim.keymap.set('n', '<A-,>', '<C-w>5>')
vim.keymap.set('n', '<A-.>', '<C-w>5<')
vim.keymap.set('n', '<A-t>', '<C-w>+')
vim.keymap.set('n', '<A-s>', '<C-w>-')
-- Buffers
vim.keymap.set('n', '<tab>', '<cmd>bn<CR>', { desc = 'Move Next Buffer' })
vim.keymap.set('n', '<S-tab>', '<cmd>bp<CR>', { desc = 'Move Previous Buffer' })
-- vim.keymap.set('n', '<leader>bd', '<cmd>bd<CR>', { desc = 'Close Buffer' })

-- Move Text
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv")

-- Delete line without registed
-- vim.keymap.set('v', 'X', '"_x')

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
