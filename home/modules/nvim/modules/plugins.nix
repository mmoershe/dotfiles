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

    dashboard.alpha = {
      enable = true;
      theme = "dashboard";
    };

    mini.icons.enable = true;
    visuals.nvim-web-devicons.enable = true;
    autocomplete.nvim-cmp.enable = true;
    statusline.lualine.enable = true;
    binds.whichKey.enable = true;
    filetree.neo-tree.enable = true;
    visuals.indent-blankline.enable = true;

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
