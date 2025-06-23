return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    cmd = 'Neotree',
    keys = {
      { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
    },
    deactivate = function()
      vim.cmd [[Neotree close]]
    end,
    opts = {

      close_if_last_window = true,
      popup_border_style = 'rounded',
      enable_git_status = true,
      enable_diagnostics = true,
      open_files_do_not_replace_types = { 'terminal', 'trouble', 'qf' }, -- when opening files, do not use windows containing these filetypes or buftypes
      sort_case_insensitive = false, -- used when sorting files and directories in the tree
      sort_function = nil,
      filesystem = {
        window = {
          mappings = {
            ['\\'] = 'close_window',
          },
        },
      },
    },
  },
  -- Oil
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    -- Optional dependencies
    -- dependencies = { { "echasnovski/mini.icons", opts = {} } },
    dependencies = { 'nvim-tree/nvim-web-devicons' }, -- use if prefer nvim-web-devicons
    config = function()
      require('oil').setup {
        columns = {
          'icon',
        },
        keymaps = {
          ['<C-h>'] = false,
          ['<A-h>'] = 'actions.select_split',
        },
        view_options = {
          show_hidden = true,
        },
      }
      vim.keymap.set('n', '<F2>', '<CMD>Oil --float<CR>', { desc = 'Open parent directory' })
    end,
  },
  -- BufferLine
  {
    'akinsho/bufferline.nvim',
    event = 'VeryLazy',
    opts = {
      options = {
        always_show_bufferline = false,
        offsets = {
          {
            filetype = 'neo-tree',
            text = 'Neo-tree',
            highlight = 'Directory',
            text_align = 'left',
          },
        },
      },
    },
  },
  -- LuaLine
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = 'VeryLazy',
    opts = {
      options = {
        theme = 'auto',
        globalstatus = vim.o.laststatus == 3,
        disabled_filetypes = {
          statusline = { 'dashboard', 'alpha', 'ministarter', 'neo-tree' },
        },
      },
      sections = {
        lualine_x = { 'filetype' },
        lualine_y = {
          function()
            return '👍👍'
          end,
        },
      },
    },
  },
  -- Noice
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = {
      'MunifTanjim/nui.nvim',
      -- 'rcarriga/nvim-notify',
    },
    opts = {
      lsp = {
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true,
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = false,
      },
      routes = {
        {
          filter = {
            event = 'msg_show',
            any = {
              { find = '%d+L, %d+B' },
              { find = '; after #%d+' },
              { find = '; before #%d+' },
            },
          },
          view = 'mini',
        },
      },
      views = {
        cmdline_popup = {
          position = {
            row = 5,
            col = '50%',
          },
          size = {
            width = 60,
            height = 'auto',
          },
        },
        popupmenu = {
          relative = 'editor',
          position = {
            row = 8,
            col = '50%',
          },
          size = {
            width = 60,
            height = 10,
          },
          border = {
            style = 'rounded',
            padding = { 0, 1 },
          },
          win_options = {
            winhighlight = { Normal = 'Normal', FloatBorder = 'DiagnosticInfo' },
          },
        },
      },
      messages = {
        -- NOTE: If you enable messages, then the cmdline is enabled automatically.
        -- This is a current Neovim limitation.
        enabled = true, -- enables the Noice messages UI
        view = 'notify', -- default view for messages
        view_error = 'notify', -- view for errors
        view_warn = 'notify', -- view for warnings
        view_history = 'messages', -- view for :messages
        view_search = 'virtualtext', -- view for search count messages. Set to `false` to disable
      },
    },
  },
  -- Which Key
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      preset = 'helix',
    },
    keys = {
      {
        '<leader>?',
        function()
          require('which-key').show { global = false }
        end,
        desc = 'Buffer Local Keymaps (which-key)',
      },
    },
  },
  -- AutoTAG
  {
    'windwp/nvim-ts-autotag',

    config = function()
      require('nvim-ts-autotag').setup {
        opts = {
          enable_close = true,
          enable_rename = true,
          enable_close_on_slash = false,
        },
      }
    end,
  },
  -- TODO-Comments
  {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {},
  },
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    cmd = 'LazyDev',
    opts = {
      library = {
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
        -- { path = 'LazyVim', words = { 'LazyVim' } },
        { path = 'snacks.nvim', words = { 'Snacks' } },
        -- { path = 'lazy.nvim', words = { 'LazyVim' } },
      },
    },
  },
}
