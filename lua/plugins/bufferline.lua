return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = {
    'nvim-tree/nvim-web-devicons'
  },
  config = function()
    require("bufferline").setup{
      options = {
        close_command = "bdelete! %d",       -- closes the buffer
        right_mouse_command = "bdelete! %d", -- right click close
        show_close_icon = false,
        show_buffer_close_icons = true,
      }
    }

    -- Map 'X' in normal mode to close the current buffer
    vim.keymap.set('n', 'X', '<cmd>bdelete!<CR>', { desc = "Close current buffer" })
  end
}

