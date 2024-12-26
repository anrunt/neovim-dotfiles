return {
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		"github/copilot.vim",
		config = function()
			vim.keymap.set("n", "<leader>ct", function()
				if vim.g.copilot_enabled then
					vim.g.copilot_enabled = false
					print("Copilot suggestions disabled")
				else
					vim.g.copilot_enabled = true
					print("Copilot suggestions enabled")
				end
			end, { desc = "Toggle Copilot suggestions" })

			vim.g.copilot_clear_on_normal_mode = true -- Clear suggestions in normal mode
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
				}),
			})
		end,
	},
}
