-- plugins/telescope.lua:
return {
'nvim-telescope/telescope.nvim',
opts = {
	defaults = {
		sorting_strategy = "ascending",
		selection_strategy = "follow",
		layout_strategy = "horizontal",
		layout_config = {
			width = 0.95
		}
	},
}, 
tag = '0.1.8',
dependencies = { 'nvim-lua/plenary.nvim' },
}
