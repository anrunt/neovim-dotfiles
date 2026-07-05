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
          "gopls",
          "rust_analyzer"
        },
        -- Servers are configured manually below. Keep mason from enabling
        -- installed servers like ts_ls alongside typescript-tools.nvim.
        automatic_enable = false,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local tailwind_capabilities = vim.tbl_deep_extend("force", {}, capabilities, {
        textDocument = {
          colorProvider = {
            dynamicRegistration = true,
          },
        },
      })

      local servers = {
        lua_ls = {
          capabilities = capabilities,
        },
        pyright = {
          capabilities = capabilities,
        },
        clangd = {
          capabilities = capabilities,
          filetypes = {
            "c", "cpp", "objc", "objcpp"
          },
          settings = {
            clangd = {
              usePlaceholders = false,
              completeUnimported = true,
            }
          }
        },
        gopls = {
          capabilities = capabilities,
          filetypes = {
            "go", "gomod", "gowork", "gotmpl"
          },
          root_markers = { "go.mod", ".git", "go.work" },
          settings = {
            gopls = {
              completeUnimported = true,
              analyses = {
                unusedparams = true,
              },
            }
          }
        },
        rust_analyzer = {
          capabilities = capabilities,
        },
        svelte = {
          capabilities = capabilities,
          root_markers = { ".git" },
        },
        tailwindcss = {
          capabilities = tailwind_capabilities,
          root_markers = { ".git", "tailwind.config.js", "tailwind.config.ts" },
          filetypes = {
            "html",
            "javascriptreact",
            "typescriptreact",
            "javascript",
            "typescript",
            "svelte",
          },
        },
        html = {
          capabilities = capabilities,
          root_markers = { ".git" },
        },
        cssls = {
          capabilities = capabilities,
          root_markers = { ".git" },
        },
      }

      for server, config in pairs(servers) do
        vim.lsp.config(server, config)
        vim.lsp.enable(server)
      end

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
