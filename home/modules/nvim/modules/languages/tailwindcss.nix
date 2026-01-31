{
  programs.nvf.settings.vim = {
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
  };
}
