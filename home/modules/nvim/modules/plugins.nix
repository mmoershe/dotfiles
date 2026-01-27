{
  programs.nvf.settings.vim = {
    telescope = {
      enable = true;
      mappings = {
        findFiles = "<leader><space>";
        liveGrep = "<leader>sg";
      };
      setupOpts = {
        color_devicons = true;
        defaults = {
          layout_strategy = "horizontal";
          layout_config = {
            width = 0.8;
            height = 0.8;
            preview_cutoff = 120;
            horizontal = {
              preview_width = 0.55;
              prompt_position = "bottom";
            };
            vertical = {
              mirror = true;
            };
          };
        };
      };
    };

    utility.snacks-nvim = {
      enable = true;
      setupOpts = {
        scroll.enabled = true;
      };
    };

    # Autopairs for brackets, quotes, etc.
    autopairs.nvim-autopairs.enable = true;

    # Comments
    comments.comment-nvim.enable = true;

    # Better surround operations
    utility.surround.enable = true;

    dashboard.alpha = {
      enable = true;
      theme = null;
      layout = [
        {
          type = "padding";
          val = 5;
        }
        {
          type = "text";
          val = [
            " ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓"
            " ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒"
            "▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░"
            "▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██ "
            "▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒"
            "░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░"
            "░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░"
            "   ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░   "
            "         ░    ░  ░    ░ ░        ░   ░         ░   "
            "                                ░                  "
          ];
          opts = {
            position = "center";
            hl = "Number";
          };
        }
        {
          type = "padding";
          val = 2;
        }
        {
          type = "button";
          val = "󰈈  New File";
          on_press.__raw = "function() vim.cmd('enew') end";
          opts = {
            position = "center";
            hl = "Function";
            shortcut = "e";
          };
        }
        {
          type = "button";
          val = "󰒲  Find File";
          on_press.__raw = "function() vim.cmd('Telescope find_files') end";
          opts = {
            position = "center";
            hl = "Function";
            shortcut = "f";
          };
        }
        {
          type = "button";
          val = "󰅚  Quit";
          on_press.__raw = "function() vim.cmd('qa') end";
          opts = {
            position = "center";
            hl = "Function";
            shortcut = "q";
          };
        }
      ];
      opts = {
        margin = 5;
      };
    };

    mini.icons.enable = true;
    visuals.nvim-web-devicons.enable = true;
    autocomplete.nvim-cmp.enable = true;
    statusline.lualine.enable = true;
    binds.whichKey.enable = true;
    filetree.neo-tree.enable = true;
    visuals.indent-blankline.enable = true;

    # Highlight TODO/FIXME/etc comments
    notes.todo-comments.enable = true;

    tabline.nvimBufferline = {
      enable = true;
      mappings = {
        cycleNext = "<S-l>";
        cyclePrevious = "<S-h>";
        closeCurrent = "<leader>bd";
      };
    };

    terminal.toggleterm = {
      enable = true;
      lazygit = {
        enable = true;
        mappings.open = "<leader>gg";
      };
    };

    git.enable = true;
    git.gitsigns.enable = true;
  };
}
