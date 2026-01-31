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

      ts = {
        enable = true;
        lsp = {
          enable = true;
          servers = [ "ts_ls" ]; # TypeScript Language Server
        };
        format = {
          enable = true;
          type = [ "prettier" ];
        };
        treesitter.enable = true;
        extraDiagnostics = {
          enable = true;
          types = [ "eslint_d" ]; # Fast ESLint for diagnostics
        };
      };

      html = {
        enable = true;
        treesitter.enable = true;
      };

      css = {
        enable = true;
        lsp = {
          enable = true;
          servers = [ "cssls" ];
        };
        treesitter.enable = true;
      };
    };

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

    # Configure TypeScript Language Server
    lsp.servers.ts-ls = {
      enable = true;
      filetypes = [ "javascript" "javascriptreact" "typescript" "typescriptreact" "tsx" "jsx" ];
      root_markers = [ "package.json" "tsconfig.json" "jsconfig.json" ".git" ];
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

    lsp.servers.tailwindcss = {
      enable = true;
      filetypes = [ "html" "css" "scss" "javascript" "javascriptreact" "typescript" "typescriptreact" "vue" "svelte" ];
      root_markers = [ "tailwind.config.js" "tailwind.config.ts" "tailwind.config.cjs" "tailwind.config.mjs" ];
      settings = {
        tailwindCSS = {
          experimental = {
            classRegex = [
              [ "cva\\(([^)]*)\\)" "[\"'`]([^\"'`]*).*?[\"'`]" ]
              [ "cn\\(([^)]*)\\)" "[\"'`]([^\"'`]*).*?[\"'`]" ]
              [ "clsx\\(([^)]*)\\)" "[\"'`]([^\"'`]*).*?[\"'`]" ]
            ];
          };
          classAttributes = [ "class" "className" "classList" "ngClass" ];
          lint = {
            cssConflict = "warning";
            invalidApply = "error";
            invalidScreen = "error";
            invalidVariant = "error";
            invalidConfigPath = "error";
            invalidTailwindDirective = "error";
            recommendedVariantOrder = "warning";
          };
          validate = true;
        };
      };
    };

    lsp.servers.cssls = {
      enable = true;
      filetypes = [ "css" "scss" "less" ];
      settings = {
        css = {
          validate = true;
          lint = {
            unknownAtRules = "ignore"; # Ignore @tailwind and other custom at-rules
          };
        };
        scss = {
          validate = true;
          lint = {
            unknownAtRules = "ignore";
          };
        };
        less = {
          validate = true;
          lint = {
            unknownAtRules = "ignore";
          };
        };
      };
    };
  };
}
