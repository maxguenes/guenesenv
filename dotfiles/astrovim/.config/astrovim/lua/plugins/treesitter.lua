-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "http",
        "css",
        "python",
        "groovy",
        "typescript",
        "javascript",
        "tsx",
      -- add more arguments for adding more treesitter parsers
    },
  },
}
