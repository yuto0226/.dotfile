return { -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  main = 'nvim-treesitter.configs', -- Sets main module to use for opts
  -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
  opts = {
    ensure_installed = {
      'asm',
      'astro',
      'bash',
      'c',
      'c_sharp',
      'cmake',
      'comment',
      'cpp',
      'css',
      'csv',
      'disassembly',
      'dockerfile',
      'doxygen',
      'git_config',
      'git_rebase',
      'gitcommit',
      'gitignore',
      'go',
      'gomod',
      'html',
      'http',
      'java',
      'javascript',
      'jinja',
      'jinja_inline',
      'json',
      'kotlin',
      -- 'latex',
      'llvm',
      'lua',
      'make',
      'markdown',
      'markdown_inline',
      'nasm',
      'nginx',
      'nim',
      'nim_format_string',
      'objdump',
      'pem',
      'perl',
      'php',
      'php_only',
      'powershell',
      'python',
      'regex',
      'rust',
      'scss',
      'sql',
      'svelte',
      'tmux',
      'toml',
      'tsx',
      'typescript',
      'verilog',
      'vhdl',
      'vim',
      'vimdoc',
      'vue',
      'xml',
      'yaml',
      'zig',
    },
    -- Autoinstall languages that are not installed
    auto_install = true,
    highlight = {
      enable = true,
      -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
      --  If you are experiencing weird indenting issues, add the language to
      --  the list of additional_vim_regex_highlighting and disabled languages for indent.
      additional_vim_regex_highlighting = { 'ruby' },
    },
    indent = { enable = true, disable = { 'ruby' } },
  },
  -- There are additional nvim-treesitter modules that you can use to interact
  -- with nvim-treesitter. You should go explore a few and see what interests you:
  --
  --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
  --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
  --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
}
