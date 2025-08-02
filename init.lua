-- Setup lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  print("Downloading lazy.nvim...")
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

-- General Neovim options
vim.opt.termguicolors = true
vim.opt.background = "dark"

-- Transparency highlights
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
vim.api.nvim_set_hl(0, "NonText", { bg = "none" })

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
    vim.api.nvim_set_hl(0, "NonText", { bg = "none" })
  end
})

-- Lua search path
package.path = package.path .. ";" .. vim.fn.stdpath("config") .. "/lua/?.lua;" .. vim.fn.stdpath("config") .. "/lua/?/init.lua"

-- Load core options
require("core.options")

-- Setup plugins
require("lazy").setup({
  {
    require("plugins.telescope"),
    require("plugins.tree"),
    require("plugins.bufferline"),
    require("plugins.lualine"),
    require("plugins.treesitter"),
    require("plugins.lsp"),
    require("plugins.autocompletion"),
    require("plugins.rose-pine")

  },
  {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local alpha = require('alpha')
      local dashboard = require('alpha.themes.dashboard')

      dashboard.section.header.val = {
        "",
        "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
        "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
        "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
        "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
        "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
        "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
        "",
        "                   *     ,MMM8&&&.            *",
        "                        MMMM88&&&&&    .",
        "                       MMMM88&&&&&&&",
        "           *           MMM88&&&&&&&&",
        "                       MMM88&&&&&&&&",
        "                       'MMM88&&&&&&'",
        "                         'MMM8&&&'      *",
        "          |\\___/|     /\\___/\\",
        "          )     (     )    ~( .              '",
        "         =\\     /=   =\\~    /=",
        "           )===(       ) ~ (",
        "          /     \\     /     \\",
        "          |     |     ) ~   (",
        "         /       \\   /     ~ \\",
        "         \\       /   \\~     ~/",
        " _/\\_/\\__  _____/____/\\_/\\__~__/_/\\_/\\_/\\_/\\_/\\_",
        "  |  |  |  |( (  |  |  | ))  |  |  |  |  |  |",
        "  |  |  |  | ) ) |  |  |//|  |  |  |  |  |  |",
        "  |  |  |  |(_(  |  |  (( |  |  |  |  |  |  |",
        "  |  |  |  |  |  |  |  |\\)|  |  |  |  |  |  |",
        "  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |",
        "",
        "                    Meow-vim Ready",
        "",
      }

      dashboard.section.buttons.val = {
        dashboard.button("e", "  New file", ":enew<CR>"),
        dashboard.button("f", "  Find file", ":edit "),
        dashboard.button("r", "  Recent files", ":oldfiles<CR>"),
        dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua<CR>"),
        dashboard.button("l", "  Lazy Manager", ":Lazy<CR>"),
        dashboard.button("q", "  Quit", ":qa<CR>"),
      }

      dashboard.section.footer.val = {
        "Neovim loaded successfully!"
      }

      alpha.setup(dashboard.config)
    end
  }
})
