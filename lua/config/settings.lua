-- settings.lua

vim.opt.shiftwidth = 4
vim.opt.clipboard = "unnamedplus"
vim.cmd [[
    highlight Normal guibg=none
    highlight NonText guibg=none
]]
vim.cmd [[
    highlight Normal ctermbg=none
    highlight NonText ctermbg=none
]]

-- run lua
vim.keymap.set("n", "<leader><leader>x", [[:source %<CR>]])
vim.keymap.set("n", "<leader>x", ":.lua<CR>")
vim.api.nvim_set_keymap("v", "<leader>x", ":lua<CR>", {
  desc = "Send visual selection to lua interpreter",
  noremap = true,
  silent = true,
})

-- call :help instead of :Man
vim.api.nvim_set_keymap("n", "<leader>k", ":help <C-R><C-W><CR>", {
  desc = "Search vimhelp for word-under-cursor",
  noremap = true,
  silent = true,
})

-- Remap :Man <cword>
vim.api.nvim_set_keymap("n", "<localleader>k", ":Man <C-R><C-W><CR>", {
  desc = "Search manpages for word-under-cursor",
  noremap = true,
  silent = true,
})

-- Oil.nvim
vim.api.nvim_set_keymap("n", "<leader>o", ":Oil<CR>", { noremap = true, silent = true })

-- Telescope

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
vim.api.nvim_create_user_command("PrettyPrintPaths", function()
  local paths = vim.api.nvim_list_runtime_paths()
  for path = 1, #paths do print(paths[path]) end
end, {})

-- Jump to next link in help files
local function jump_to_link(direction)
  local flags = direction or ""
  local line, col = unpack(vim.fn.searchpos('|[^|]*|', flags))
  if line == 0 then
    vim.notify("No more links found: line == " .. line, vim.log.levels.INFO)
  else
    vim.api.nvim_win_set_cursor(0, { line, col - 1 })
  end

  vim.notify("flags: " .. flags, vim.log.levels.INFO)
end

local function jump_to_next_link()
  jump_to_link()
end

local function jump_to_prev_link()
  jump_to_link("b")
end

vim.api.nvim_create_augroup("helpful", {})

vim.api.nvim_create_autocmd("FileType", {
  group = "helpful",
  pattern = "help",
  callback = function()
    vim.api.nvim_buf_create_user_command(0, "NextLink", jump_to_next_link, {})
    vim.api.nvim_buf_set_keymap(0, 'n', 'f', ":NextLink<CR>", { noremap = true, silent = true })
    vim.api.nvim_buf_create_user_command(0, "PrevLink", jump_to_prev_link, {})
    vim.api.nvim_buf_set_keymap(0, 'n', 'F', ":PrevLink<CR>", { noremap = true, silent = true })
  end
})

vim.api.nvim_create_autocmd("FileType", {
  group = "helpful",
  pattern = "help",
  callback = function()
    vim.keymap.set('n', '<CR>',
      function()
        local line = vim.api.nvim_get_current_line()
        local col = vim.fn.col('.')
        local link = line:match("|(%S+)|", col - 1)
        if link then
          vim.schedule(function()
            vim.cmd("help " .. link)
          end)
          return ""
        else
          return vim.api.nvim_replace_termcodes("<CR>", true, false, true)
        end
      end,
      { buffer = true, silent = true, expr = true })
  end
})
