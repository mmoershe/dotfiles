{
  programs.nvf.settings.vim = {
    languages.python = {
      enable = true;
      lsp = {
        enable = true;
        servers = ["basedpyright"];
      };
      format = {
        enable = true;
        type = ["ruff"];
      };
      treesitter.enable = true;
      dap.enable = false;
    };

    lsp.servers.basedpyright = {
      enable = true;
      filetypes = ["python"];
      root_markers = ["pyproject.toml" "setup.py" "setup.cfg" "requirements.txt" ".git"];
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

    # Ruff linting for Python
    diagnostics.nvim-lint.linters_by_ft.python = [ "ruff" ];
  };
}

