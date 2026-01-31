{
  programs.nvf.settings.vim = {
    lsp = {
      enable = true;
      formatOnSave = false;
      lspkind.enable = true; # Nice icons in completion menu
      lspSignature.enable = true; # Function signature help while typing
      trouble.enable = true; # Better diagnostics list
      inlayHints.enable = true; # Inlay hints for types, parameters
      lightbulb.enable = true; # Code action indicator
    };

    formatter.conform-nvim.enable = true;

    treesitter.enable = true;
    treesitter.indent.enable = true;
    treesitter.context.enable = true; # Sticky context at top of buffer

    diagnostics = {
      enable = true;
      config = {
        virtual_text = true; # Disable inline virtual text (use virtual_lines instead)
        virtual_lines = false; # Show diagnostics as virtual lines below code
        signs = true;
        underline = true;
        update_in_insert = false;
      };
      nvim-lint = {
        enable = true;
        linters_by_ft = {};
      };
    };

    languages = {
      enableFormat = true;
    };
  };
}
