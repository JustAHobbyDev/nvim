-- settings.lua

vim.opt.shiftwidth = 4
vim.opt.clipboard = "unnamedplus"

-- run lua
vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<leader>x", ":.lua<CR>")
vim.keymap.set("v", "<leader>x", ":lua<CR>")

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
vim.o.laststatus = 3

-- Highlight when yanking text
-- Try it with `yap` in normal mode
-- See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- PrettyPrintPaths
PrettyPrintPaths = function()
  local paths = vim.api.nvim_list_runtime_paths()
  for path = 1, #paths do print(paths[path]) end
end
