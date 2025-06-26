require 'core.keymaps'
require 'core.options'

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
      { out,                            'WarningMsg' },
      { '\nPress any key to exit...' },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- Setup lazy.nvim
require('lazy').setup {
  spec = {
    -- add your plugins here
    require 'plugins.colortheme',       -- Catppuccin color themes
    require 'plugins.neotree',          -- File explorer
    require 'plugins.bufferline',       -- Tab management
    require 'plugins.lualine',          -- Status line
    require 'plugins.treesitter',       -- Syntax highlighting and code navigation
    require 'plugins.telescope',        -- Fuzzy finder
    require 'plugins.lsp',              -- Language Server Protocol support
    require 'plugins.cmp',              -- Autocompletion
    require 'plugins.none-ls',          -- Linting and formatting
    require 'plugins.gitsigns',         -- Git integration
    require 'plugins.alpha',            -- Startup dashboard
    require 'plugins.indent-blankline', -- Indentation guides
    require 'plugins.misc',             -- Miscellaneous plugins
    require 'plugins.rust',             -- rust
    require 'plugins.markdown',         -- markdown
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { 'catppuccin' } },
  -- automatically check for plugin updates
  checker = { enabled = true },
}
