vim.api.nvim_create_autocmd("FileType", {
	pattern = "oil",
	callback = function()
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
	end,
})

return {
	{
		"stevearc/oil.nvim",
		opts = {},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("oil").setup({
				keymaps = {
					["g?"] = "actions.show_help",
					["<CR>"] = "actions.select",
					["<C-\\>"] = "actions.select_vsplit",
					["<C-enter>"] = "actions.select_split", -- this is used to navigate left
					["<C-t>"] = "actions.select_tab",
					["<C-p>"] = "actions.preview",
					["<C-c>"] = "actions.close",
					["<C-r>"] = "actions.refresh",
					["-"] = "actions.parent",
					["_"] = "actions.open_cwd",
					["`"] = "actions.cd",
					["~"] = "actions.tcd",
					["gs"] = "actions.change_sort",
					["gx"] = "actions.open_external",
					["g."] = "actions.toggle_hidden",
				},
				use_default_keymaps = false,
				skip_confirm_for_simple_edits = false,
				view_options = {
					show_hidden = true,
				},
				float = {
					max_width = 80,
					max_height = 20,
				},
				vim.keymap.set("n", "<leader>pf", function()
					require("oil").toggle_float()
				end, {
					noremap = true,
					silent = true,
					desc = "Open oil",
				}),
			})
		end,
	},
}