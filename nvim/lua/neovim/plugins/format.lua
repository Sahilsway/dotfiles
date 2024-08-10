return {
	"stevearc/conform.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
	dependencies = {
		"williamboman/mason.nvim",
	},
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				["markdown.mdx"] = { "prettierd" },
				bash = { "shfmt" },
				lua = { "stylua" },
				css = { "prettierd" },
				-- go = { "goimports", "gofumpt" },
				html = { "prettierd" },
				javascript = { "prettierd" },
				javascriptreact = { "prettierd" },
				json = { "prettierd" },
				-- gleam = { "gleam" },
				jsonc = { "prettierd" },
				less = { "prettierd" },
				markdown = { "prettierd" },
				sass = { "prettierd" },
				scss = { "prettierd" },
				typescript = { "prettierd" },
				typescriptreact = { "prettierd" },
				yaml = { "prettierd" },
				zsh = { "beautysh" },
				python = { "black", "isort" },
			},
			formatters = {
				injected = { options = { ignore_errors = true } },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			},
			format_after_save = {
				lsp_fallback = true,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>lf", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
