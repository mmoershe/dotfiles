{
  programs.nvf.settings.vim.maps = {
    normal = {
      "<leader>e" = {
        action = "<cmd>Neotree toggle<CR>";
        noremap = true;
        silent = true;
        desc = "Toggle Neotree";
      };
      "<C-h>" = {
        action = "<C-w>h";
        noremap = true;
        silent = true;
        desc = "Move to left window";
      };
      "<C-j>" = {
        action = "<C-w>j";
        noremap = true;
        silent = true;
        desc = "Move to bottom window";
      };
      "<C-k>" = {
        action = "<C-w>k";
        noremap = true;
        silent = true;
        desc = "Move to top window";
      };
      "<C-l>" = {
        action = "<C-w>l";
        noremap = true;
        silent = true;
        desc = "Move to right window";
      };
      "<leader>tf" = {
        action = "<cmd>lua require('conform').format()<CR>";
        noremap = true;
        silent = true;
        desc = "Format with Conform";
      };
    };
  };
}
