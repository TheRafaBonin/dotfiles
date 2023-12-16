local lsp_zero = require('lsp-zero').preset({manage_nvim_cmp = false})

-- setup lsp_config
lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({
      buffer = bufnr,
      preserve_mappings = false
  })
end)

-- Setup Mason with lsp_config
require("mason").setup {
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
}

require("mason-lspconfig").setup {
    ensure_installed = { "lua_ls", "golangci_lint_ls", "gopls", "nil_ls", "rnix" },
    automatic_installation = true,
    handlers = {
        lsp_zero.default_setup,
    },
}

