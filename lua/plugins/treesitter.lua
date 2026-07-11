local parser_languages = {
	"bash",
	"css",
	"gleam",
	"go",
	"html",
	"javascript",
	"json",
	"lua",
	"markdown",
	"markdown_inline",
	"ocaml",
	"ocaml_interface",
	"rust",
	"svelte",
	"terraform",
	"tsx",
	"typescript",
	"vimdoc",
	"yaml",
	"zig",
}

return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "master",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = parser_languages,
				auto_install = true,
				highlight = { enable = true },
				indent = {
					enable = true,
					disable = { "ocaml", "ocaml_interface" },
				},
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		branch = "master",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("nvim-treesitter.configs").setup({
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
					},
					move = {
						enable = true,
						set_jumps = true,
					},
				},
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			local tsc = require("treesitter-context")

			tsc.setup({
				enable = false,
				max_lines = 1,
				trim_scope = "inner",
			})
		end,
	},
}
