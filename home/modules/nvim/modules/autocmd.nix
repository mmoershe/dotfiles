{lib, ...}:
let
  inherit (lib.generators) mkLuaInline;
in
{
  programs.nvf.settings.vim = {
    autocmds = [
      {
        event = ["TextYankPost"];
        pattern = ["*"];
        callback = mkLuaInline ''
          function()
            vim.highlight.on_yank()
          end
        '';
      }
    ];
  };
}
