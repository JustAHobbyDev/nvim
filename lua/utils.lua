local paths = vim.api.nvim_list_runtime_paths()
for path = 1, #paths do
	print(paths[path])
end

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
local lazypath_exists = vim.loop.fs_stat(lazypath)
if lazypath_exists then
  print(lazypath)
end
