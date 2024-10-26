return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "Hoffs/omnisharp-extended-lsp.nvim"
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "arduino_language_server", "asm_lsp", "autotools_ls", "bashls", "clangd", "cmake", "golangci_lint_ls", "jsonls", "jdtls", "kotlin_language_server", "marksman", "pylsp", "robotframework_ls", "vuels", "rust_analyzer", "omnisharp" }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.gdscript.setup({})
      lspconfig.lua_ls.setup({})
      lspconfig.arduino_language_server.setup({})
      lspconfig.asm_lsp.setup({})
      lspconfig.autotools_ls.setup({})
      lspconfig.bashls.setup({})
      lspconfig.clangd.setup({})
      lspconfig.cmake.setup({})
      lspconfig.golangci_lint_ls.setup({})
      lspconfig.jsonls.setup({})
      lspconfig.jdtls.setup({})
      lspconfig.kotlin_language_server.setup({})
      lspconfig.marksman.setup({})
      lspconfig.pylsp.setup({})
      lspconfig.robotframework_ls.setup({})
      lspconfig.vuels.setup({})
      lspconfig.rust_analyzer.setup({})
      lspconfig.omnisharp.setup({})
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})
    end
  }
}
