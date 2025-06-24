return {
  'catppuccin/nvim',
  name = 'catppuccin',
  lazy = false,
  priority = 1000,
  config = function()
    local transparent_background = true

    local toggle_transparency = function()
      transparent_background = not transparent_background
      require('catppuccin').setup {
        transparent_background = transparent_background,
      }
      vim.cmd.colorscheme 'catppuccin'
    end

    vim.keymap.set('n', '<leader>bg', toggle_transparency, { noremap = true, silent = true })

    require('catppuccin').setup {
      flavour = 'mocha', -- latte, frappe, macchiato, mocha
      background = { -- :h background
        light = 'latte',
        dark = 'mocha',
      },
      transparent_background = transparent_background, -- disables setting the background color.
    }
    vim.cmd.colorscheme 'catppuccin'
  end,
}
