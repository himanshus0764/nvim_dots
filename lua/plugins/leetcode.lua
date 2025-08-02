return {
  "kawre/leetcode.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-telescope/telescope.nvim", -- or use fzf-lua/snacks-picker
  },
  build = ":TSUpdate html",
  cmd = "Leet",
  opts = {
    lang = "cpp", -- or "python3"
    plugins = {
      non_standalone = true,
    },
  },
}

