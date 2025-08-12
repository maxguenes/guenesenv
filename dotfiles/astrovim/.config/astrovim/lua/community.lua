-- AstakroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",

  -- Programming Languages Support
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.pack.docker" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.pack.xml" },
  { import = "astrocommunity.pack.xml" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.programming-language-support.rest-nvim" },

  -- Docker
  { import = "astrocommunity.docker.lazydocker" },

  -- Code Runner
  { import = "astrocommunity.code-runner.executor-nvim" },
  { import = "astrocommunity.code-runner.overseer-nvim" },

  -- Diagnostics
  { import = "astrocommunity.diagnostics.trouble-nvim" },

  -- File Finder
  { import = "astrocommunity.fuzzy-finder.snacks-picker" },
  { import = "astrocommunity.fuzzy-finder.telescope-nvim" },

  -- LSP
  { import = "astrocommunity.lsp.lspsaga-nvim" },

  -- Theme
  { import = "astrocommunity.color.transparent-nvim" },
  { import = "astrocommunity.colorscheme/palenight-nvim" },

  -- Mappings & Keybindings
  { import = "astrocommunity.keybinding.nvcheatsheet-nvim" },

  -- Auto Session
  { import = "astrocommunity.recipes.auto-session-restore" },
}
