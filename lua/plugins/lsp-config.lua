return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "svelte",
          "tailwindcss",
          "html",
          "cssls",
          "pyright",
          "clangd",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")

      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })

      lspconfig.pyright.setup({
        capabilities = capabilities,
      })

      lspconfig.clangd.setup({
        capabilities = capabilities,
        filetypes = {
          "c", "cpp", "objc", "objcpp"
        },
      })

      --			lspconfig.tsserver.setup({
      --				capabilities = capabilities,
      --				root_dir = require("lspconfig.util").root_pattern(".git"),
      --			})

      lspconfig.svelte.setup({
        capabilities = capabilities,
        root_dir = require("lspconfig.util").root_pattern(".git"),
      })

--      lspconfig.tailwindcss.setup({
--        capabilities = capabilities,
--        root_dir = require("lspconfig.util").root_pattern(".git"),
--      })

      lspconfig.tailwindcss.setup({
        capabilities = capabilities,
        root_dir = lspconfig.util.root_pattern(".git", "tailwind.config.js", "tailwind.config.ts"),
        filetypes = {
          "html",
          "javascriptreact",
          "typescriptreact",
          "javascript",
          "typescript",
          "svelte",
        },
      })

      lspconfig.html.setup({
        capabilities = capabilities,
        root_dir = require("lspconfig.util").root_pattern(".git"),
      })

      lspconfig.cssls.setup({
        capabilities = capabilities,
        root_dir = require("lspconfig.util").root_pattern(".git"),
      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", {})

      vim.diagnostic.config({
        virtual_text = true, -- Show inline errors
        signs = true,        -- Show signs in the gutter
        underline = true,    -- Underline errors
        update_in_insert = true, -- Don't update in insert mode
        severity_sort = true, -- Sort by severity
      })

    end,
  },
  {
    "pmizio/typescript-tools.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
  },
}
