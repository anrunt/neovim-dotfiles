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

      local function custom_diagnostic_config(client, bufnr)
        local ft = vim.api.nvim_buf_get_option(bufnr, "filetype")

        if ft == "python" or ft == "c" then
          vim.diagnostic.config({
            virtual_text = true,
            signs = true,
            underline = true,
            update_in_insert = true,
            severity_sort = true,
          }, bufnr)
        else
          -- Default diagnostic config for other filetypes
          vim.diagnostic.config({
            virtual_text = true,
            signs = true,
            underline = true,
            update_in_insert = false,
            severity_sort = true,
          }, bufnr)
        end
      end

      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        on_attach = custom_diagnostic_config
      })

      lspconfig.pyright.setup({
        capabilities = capabilities,
        on_attach = custom_diagnostic_config
      })

      lspconfig.clangd.setup({
        capabilities = capabilities,
        filetypes = {
          "c", "cpp", "objc", "objcpp"
        },
        on_attach = custom_diagnostic_config
      })

      --			lspconfig.tsserver.setup({
      --				capabilities = capabilities,
      --				root_dir = require("lspconfig.util").root_pattern(".git"),
      --			})

      lspconfig.svelte.setup({
        capabilities = capabilities,
        root_dir = require("lspconfig.util").root_pattern(".git"),
        on_attach = custom_diagnostic_config
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
        on_attach = custom_diagnostic_config
      })

      lspconfig.html.setup({
        capabilities = capabilities,
        root_dir = require("lspconfig.util").root_pattern(".git"),
        on_attach = custom_diagnostic_config
      })

      lspconfig.cssls.setup({
        capabilities = capabilities,
        root_dir = require("lspconfig.util").root_pattern(".git"),
        on_attach = custom_diagnostic_config
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
