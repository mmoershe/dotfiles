{
  programs.nvf.settings.vim = {
    lsp = {
      enable = true;
      formatOnSave = false;
    };

    formatter.conform-nvim.enable = true;

    treesitter.enable = true;
    treesitter.indent.enable = true;

    languages = {
      enableFormat = true;
      lua.enable = true;
      markdown.enable = true;
      nix.enable = true;

      python = {
        enable = true;
        lsp = {
          enable = true;
          servers = [ "basedpyright" ];
        };
        format = {
          enable = true;
          type = [ "ruff" ];
        };
        treesitter.enable = true;
        dap.enable = false;
      };

    };
  };
}
