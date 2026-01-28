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
      {
        event = ["FocusGained" "BufEnter" "CursorHold" "CursorHoldI"];
        pattern = ["*"];
        callback = mkLuaInline ''
          function()
            if vim.fn.mode() ~= 'c' then
              vim.cmd('checktime')
            end
          end
        '';
      }
      {
        event = ["FileChangedShellPost"];
        pattern = ["*"];
        callback = mkLuaInline ''
          function()
            vim.notify("File changed on disk. Buffer reloaded.", vim.log.levels.WARN)
          end
        '';
      }
    ];
  };
}
