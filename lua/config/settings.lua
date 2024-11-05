-- settings.lua
--

vim.cmd[[colorscheme no-clown-fiesta]]


-- call :help instead of :Man
vim.api.nvim_set_keymap("n", "<leader>k", ":help <C-R><C-W><CR>", { noremap = true, silent = true })
-- Oil.nvim
vim.api.nvim_set_keymap("n", "<leader>o", ":O<CR>", { noremap = true, silent = true })
-- Telescope
vim.api.nvim_set_keymap("n", "<leader>b", ":Telescope buffers<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>f", ":Telescope find_files<CR>", { noremap = true, silent = true })
-- Lazy.nvim
vim.api.nvim_set_keymap("n", "<leader>L", ":Lazy <CR>", { noremap = true, silent = true })


function SaveVisualSelectionToRegister(register)
    -- Get the start and end of the visual selection
    local start_row, start_col = vim.fn.getpos("'<")[2], vim.fn.getpos("'<")[3]
    local end_row, end_col = vim.fn.getpos("'>")[2], vim.fn.getpos("'>")[3]

    -- Get the selected text
    local lines = vim.fn.getline(start_row, end_row)
    if #lines == 0 then return end

    -- Trim the selection to only the selected columns
    lines[#lines] = string.sub(lines[#lines], 1, end_col)
    lines[1] = string.sub(lines[1], start_col)

    -- Join lines into a single text block if multi-line
    local selection_text = table.concat(lines, "\n")

    -- Set the text to the specified register
    vim.fn.setreg(register, selection_text)
end


function VisualYank()
	SaveVisualSelectionToRegister('"')
end


function RunVisualSelection()
	VisualYank()
    local func, err = loadstring(vim.fn.getreg('"'))
    local ok, err = pcall(func())
    if not ok then
	    print("Error running Lua code: " .. err)
    end
end

vim.api.nvim_set_keymap("v", "<leader>r", ":lua RunVisualSelection()<CR>", { noremap = true, silent = true })

vim.api.nvim_set_hl(0, "Normal", { bg = NONE })
vim.api.nvim_set_hl(0, "Cursor", { bg = "white", fg = "black", blend = 90 })
vim.api.nvim_set_hl(0, "CursorLine", { bg = NONE, underline = true })
vim.api.nvim_set_hl(0, "Search", { bg = "#282a2e", fg = "#f0c674", bold = true, underline = true })
vim.api.nvim_set_hl(0, "IncSearch", { bg = "NONE", fg = "#f0c674", underline = true })
vim.api.nvim_set_hl(0, "CurSearch", { bg = "#c5c8c6", fg = "#1d1f21", underline = true })
