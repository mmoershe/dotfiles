{
  programs.nvf.settings.vim = {
    lsp.enable = true;
    lsp.formatOnSave = false;
    languages = {
      lua.enable = true;
      markdown.enable = true;
      nix.enable = true;
    };

    treesitter.enable = true;
  };
}
