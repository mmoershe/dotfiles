{
  programs.nvf.settings.vim = {
    languages.css = {
      enable = true;
      lsp = {
        enable = true;
        servers = [ "cssls" ];
      };
      treesitter.enable = true;
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
