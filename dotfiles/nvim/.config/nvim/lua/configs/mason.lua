local ensure_installed = {
    "stylua", -- Used to format lua code
    "black", 
    "debugpy", 
    "mypy", 
    "npm-groovy-lint",
    "shfmt",
     -- "ruff-lsp",    
}

local lsp_servers = require("utils.lsp").servers
vim.list_extend(ensure_installed, lsp_servers)


require("mason-tool-installer").setup {
    ensure_installed = ensure_installed,
    automatic_installation = true,
    run_on_start = true,
    integrations = {
        ['mason-lspconfig'] = true,
        ['mason-nvim-dap'] = true,
    },
}