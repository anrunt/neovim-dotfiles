return {
  "luckasRanarison/tailwind-tools.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    -- tailwind-tools still checks the deprecated lspconfig module on startup.
    -- Keep the warning hidden, but let our own tailwindcss LSP config from
    -- lua/plugins/lsp-config.lua handle the server setup through vim.lsp.config.
    local original_deprecate = vim.deprecate
    vim.deprecate = function(name, alternative, ...)
      if name == "require('lspconfig')" and alternative == "vim.lsp.config" then
        return
      end

      return original_deprecate(name, alternative, ...)
    end

    local ok, err = pcall(require("tailwind-tools").setup, {
      server = {
        override = false,
      },
    })

    vim.deprecate = original_deprecate

    if not ok then
      error(err)
    end
  end
}
