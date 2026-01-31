{
  programs.nvf.settings.vim = {
    languages.ts = {
      enable = true;
      lsp = {
        enable = true;
        servers = ["ts_ls"]; # TypeScript Language Server (also handles JavaScript)
      };
      format = {
        enable = true;
        type = ["prettier"];
      };
      treesitter.enable = true;
      extraDiagnostics = {
        enable = true;
        types = ["eslint_d"]; # Fast ESLint for diagnostics
      };
    };

    # Configure TypeScript/JavaScript Language Server
    lsp.servers.ts-ls = {
      enable = true;
      filetypes = ["javascript" "javascriptreact" "typescript" "typescriptreact" "tsx" "jsx"];
      root_markers = ["package.json" "tsconfig.json" "jsconfig.json" ".git"];
      settings = {
        typescript = {
          inlayHints = {
            includeInlayParameterNameHints = "all";
            includeInlayParameterNameHintsWhenArgumentMatchesName = true;
            includeInlayFunctionParameterTypeHints = true;
            includeInlayVariableTypeHints = true;
            includeInlayVariableTypeHintsWhenTypeMatchesName = true;
            includeInlayPropertyDeclarationTypeHints = true;
            includeInlayFunctionLikeReturnTypeHints = true;
            includeInlayEnumMemberValueHints = true;
          };
        };
        javascript = {
          inlayHints = {
            includeInlayParameterNameHints = "all";
            includeInlayParameterNameHintsWhenArgumentMatchesName = true;
            includeInlayFunctionParameterTypeHints = true;
            includeInlayVariableTypeHints = true;
            includeInlayVariableTypeHintsWhenTypeMatchesName = true;
            includeInlayPropertyDeclarationTypeHints = true;
            includeInlayFunctionLikeReturnTypeHints = true;
            includeInlayEnumMemberValueHints = true;
          };
        };
      };
    };
  };
}
