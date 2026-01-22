{
  config,
  pkgs,
  lib,
  nvf,
  ...
}:

{
  imports = [ nvf.homeManagerModules.default ];

  home.packages = with pkgs; [
    tree-sitter
    gcc
    gnumake
    nodejs
    luarocks
    lua5_1
    ripgrep
    fd
    unzip
    mermaid-cli
    imagemagick
    trashy
    cargo
    marksman
    ghostscript
    tectonic
  ];

  programs.nvf = {
    enable = true;

    settings.vim = {
      options = {
        number = true;
        relativenumber = true;
        clipboard = "unnamedplus";
        tabstop = 4;
        shiftwidth = 4;
        smartindent = true;
        expandtab = true;
        softtabstop = 4;
        breakindent = true;
        wrap = true;
        mouse = "a";
        showmode = false;
      };

      viAlias = true;
      vimAlias = true;

      theme = {
        enable = true;
        name = "dracula";
        style = "mocha";
      };

      lsp.enable = true;
      lsp.formatOnSave = false;
      languages = {
        lua.enable = true;
        markdown.enable = true;
        nix.enable = true;
      };

      treesitter.enable = true;
      telescope = {
        enable = true;
        mappings = {
          findFiles = "<leader><space>";
          liveGrep = "<leader>sg";
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
      autocomplete.nvim-cmp.enable = true;
      statusline.lualine.enable = true;
      tabline.nvimBufferline.enable = true;
      binds.whichKey.enable = true;
      filetree.neo-tree.enable = true;

      terminal.toggleterm = {
        enable = true;
        lazygit = {
          enable = true;
          mappings.open = "<leader>gg";
        };
      };

      git.enable = true;
      git.gitsigns.enable = true;

      maps = {
        normal = {
          "<leader>e" = {
            action = "<cmd>Neotree toggle<CR>";
            noremap = true;
            silent = true;
            desc = "Toggle Neotree";
          };
          "<C-h>" = {
            action = "<C-w>h";
            noremap = true;
            silent = true;
            desc = "Move to left window";
          };
          "<C-j>" = {
            action = "<C-w>j";
            noremap = true;
            silent = true;
            desc = "Move to bottom window";
          };
          "<C-k>" = {
            action = "<C-w>k";
            noremap = true;
            silent = true;
            desc = "Move to top window";
          };
          "<C-l>" = {
            action = "<C-w>l";
            noremap = true;
            silent = true;
            desc = "Move to right window";
          };
        };
      };
    };
  };
}
