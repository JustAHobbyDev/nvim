-- settings.lua
--

-- call :help instead of :Man
vim.api.nvim_set_keymap("n", "<leader>k", ":help <C-R><C-W><CR>", { noremap = true, silent = true })

-- Oil.nvim
vim.api.nvim_set_keymap("n", "<leader>o", ":O<CR>", { noremap = true, silent = true })

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- Lazy.nvim
vim.api.nvim_set_keymap("n", "<leader>L", ":Lazy <CR>", { noremap = true, silent = true })

-- Highlights
vim.opt.hlsearch = false
vim.api.nvim_set_hl(0, "IncSearch", { bg = "#aaf0d1", fg = "black", blend = 50 })

-- line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- status bars
-- vim.o.winbar = "%t %m %= mode:" .. vim.api.nvim_get_mode().mode .. " %= %Y "
vim.o.laststatus = 1

