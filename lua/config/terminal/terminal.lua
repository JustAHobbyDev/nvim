-- Map a key (e.g., <Leader>e) to parse the terminal output and open the file at the specified line
local function kill_terminal_goto_error()
  -- Get the content of the terminal buffer
  local bufnr = vim.fn.bufnr('%')
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
  local output = table.concat(lines, '\n')

  -- Extract filename:linenr using the regex
  local match = vim.fn.matchstr(output, [[\w\+\.lua\:\d\+]])

  if match ~= '' then
    -- Split the match into filename and linenr
    local filename, linenr = match:match('([^:]+):(%d+)')

    -- Close the terminal buffer
    vim.cmd('bdelete')

    -- Open the file at the specified line
    vim.cmd('edit +' .. linenr .. ' ' .. filename)
  else
    print('No filename:linenr found in terminal output')
  end
end

-- { noremap = true, silent = true })
