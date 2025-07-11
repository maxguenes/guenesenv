return {
    {
        "stevearc/conform.nvim",
        event = "BufWritePre", -- uncomment for format on save
        opts = require "configs.conform"
    },
    {
        "ckipp01/nvim-jenkinsfile-linter",
        lazy = false,
        dependencies = {"nvim-lua/plenary.nvim"},
    },
}
