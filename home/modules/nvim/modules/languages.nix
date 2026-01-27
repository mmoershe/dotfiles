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
        virtual_text = false; # Disable inline virtual text (use virtual_lines instead)
        virtual_lines = true; # Show diagnostics as virtual lines below code
        signs = true;
        underline = true;
        update_in_insert = false;
      };
      # Ruff linting for Python (since Python doesn't have extraDiagnostics in NVF)
      nvim-lint = {
        enable = true;
        linters_by_ft = {
          python = [ "ruff" ];
        };
      };
    };

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

    # Configure basedpyright settings via vim.lsp.servers (Neovim 0.11 API)
    lsp.servers.basedpyright = {
      enable = true;
      filetypes = [ "python" ];
      root_markers = [ "pyproject.toml" "setup.py" "setup.cfg" "requirements.txt" ".git" ];
      settings = {
        basedpyright = {
          analysis = {
            autoSearchPaths = true;
            useLibraryCodeForTypes = true;
            diagnosticMode = "openFilesOnly";
            typeCheckingMode = "standard"; # Options: off, basic, standard, strict, all
            autoImportCompletions = true;
            inlayHints = {
              variableTypes = true;
              functionReturnTypes = true;
              callArgumentNames = true;
              pytestParameters = true;
            };
          };
        };
      };
    };
  };
}
