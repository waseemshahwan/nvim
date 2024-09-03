local configs = require("nvchad.configs.lspconfig")

local on_attach = configs.on_attach
local on_init = configs.on_init
local capabilities = configs.capabilities

vim.api.nvim_create_user_command(
  "MasonInstallAll",
  function()
    local lspconfig = require "lspconfig"
    local servers = { "html", "cssls", "clangd", "tsserver", "biome" }

    for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
        on_init = on_init,
        on_attach = on_attach,
        capabilities = capabilities,
      }
    end
  end,
  {}
)

vim.cmd.MasonInstallAll()
