return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim", -- for eslint_d
  },
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        -- Lua
        null_ls.builtins.formatting.stylua,

        -- Python
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,

        -- C
        null_ls.builtins.formatting.clang_format,

        -- Go
        --null_ls.builtins.formatting.gofmt,
        null_ls.builtins.formatting.gofumpt.with({
          extra_args = { "-s" },
        }),
        null_ls.builtins.formatting.goimports,

        -- TS etc.
        null_ls.builtins.formatting.prettier,
        require("none-ls.code_actions.eslint_d"),
      },
    })

    --vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    vim.keymap.set("n", "<leader>gf", function()
      vim.lsp.buf.format()
      vim.cmd("retab")
    end, {})
  end,
}
