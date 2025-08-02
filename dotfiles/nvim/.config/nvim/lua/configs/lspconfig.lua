require("nvchad.lsp").diagnostic_config()
local map = vim.keymap.set

local on_attach = function(_, bufnr)
  local function opts(desc)
    return { buffer = bufnr, desc = "LSP " .. desc }
  end

  require("lsp_signature").on_attach({
    bind = true,
    hint_prefix = " ",
    handler_opts = {
      border = "rounded",
    },
  }, bufnr)

  map("n", "gD", vim.lsp.buf.declaration, opts "Go to declaration")
  map("n", "gd", vim.lsp.buf.definition, opts "Go to definition")
  map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts "Add workspace folder")
  map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts "Remove workspace folder")

  map("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts "List workspace folders")

  map("n", "<leader>D", vim.lsp.buf.type_definition, opts "Go to type definition")
  map("n", "<leader>ra", require "nvchad.lsp.renamer", opts "NvRenamer")
end

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    on_attach(_, args.buf)
  end,
})

local on_init = function(client, _)
  if client.supports_method "textDocument/semanticTokens" then
    client.server_capabilities.semanticTokensProvider = nil
  end
end

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = require("blink.cmp").get_lsp_capabilities()
local servers = require("utils.lsp").servers

vim.lsp.config("*", { capabilities = capabilities, on_init = on_init })
for server, cfg in pairs(servers) do
  vim.lsp.config(server, cfg)
  vim.lsp.enable(server)
end
require("mason-lspconfig").setup {
  -- handlers = {
  --   function(server_name)
  --     local server_config = servers[server_name] or {}
  --
  --     -- server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
  --
  --     -- lspconfig[server_name].setup(server)
  --     -- print(server_name)
  --     -- print(server_config)
  --     vim.lsp.config(server_name, server_config)
  --     vim.lsp.enable(server_name)
  --   end,
  -- },
}
