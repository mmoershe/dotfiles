{
  programs.nvf.settings.vim.maps = {
    normal = {
      # File tree
      "<leader>e" = {
        action = "<cmd>Neotree toggle<CR>";
        noremap = true;
        silent = true;
        desc = "Toggle Neotree";
      };

      # Window navigation
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

      # Formatting
      "<leader>tf" = {
        action = "<cmd>lua require('conform').format()<CR>";
        noremap = true;
        silent = true;
        desc = "Format with Conform";
      };
      "<leader>lf" = {
        action = "<cmd>lua require('conform').format()<CR>";
        noremap = true;
        silent = true;
        desc = "Format with Conform";
      };
      "<leader>cf" = {
        action = "<cmd>lua require('conform').format()<CR>";
        noremap = true;
        silent = true;
        desc = "Format buffer";
      };

      # LSP keymaps
      "gd" = {
        action = "<cmd>lua vim.lsp.buf.definition()<CR>";
        noremap = true;
        silent = true;
        desc = "Go to definition";
      };
      "gD" = {
        action = "<cmd>lua vim.lsp.buf.declaration()<CR>";
        noremap = true;
        silent = true;
        desc = "Go to declaration";
      };
      "gr" = {
        action = "<cmd>Telescope lsp_references<CR>";
        noremap = true;
        silent = true;
        desc = "Find references";
      };
      "gi" = {
        action = "<cmd>Telescope lsp_implementations<CR>";
        noremap = true;
        silent = true;
        desc = "Go to implementation";
      };
      "gy" = {
        action = "<cmd>lua vim.lsp.buf.type_definition()<CR>";
        noremap = true;
        silent = true;
        desc = "Go to type definition";
      };
      "K" = {
        action = "<cmd>lua vim.lsp.buf.hover()<CR>";
        noremap = true;
        silent = true;
        desc = "Hover documentation";
      };
      "<leader>ca" = {
        action = "<cmd>lua vim.lsp.buf.code_action()<CR>";
        noremap = true;
        silent = true;
        desc = "Code actions";
      };
      "<leader>cr" = {
        action = "<cmd>lua vim.lsp.buf.rename()<CR>";
        noremap = true;
        silent = true;
        desc = "Rename symbol";
      };
      "<leader>cs" = {
        action = "<cmd>Telescope lsp_document_symbols<CR>";
        noremap = true;
        silent = true;
        desc = "Document symbols";
      };
      "<leader>cS" = {
        action = "<cmd>Telescope lsp_workspace_symbols<CR>";
        noremap = true;
        silent = true;
        desc = "Workspace symbols";
      };
      "<leader>ck" = {
        action = "<cmd>lua vim.lsp.buf.signature_help()<CR>";
        noremap = true;
        silent = true;
        desc = "Signature help";
      };

      # Diagnostics
      "<leader>xx" = {
        action = "<cmd>Trouble diagnostics toggle<CR>";
        noremap = true;
        silent = true;
        desc = "Toggle Trouble diagnostics";
      };
      "<leader>xX" = {
        action = "<cmd>Trouble diagnostics toggle filter.buf=0<CR>";
        noremap = true;
        silent = true;
        desc = "Buffer diagnostics (Trouble)";
      };
      "<leader>xq" = {
        action = "<cmd>Trouble quickfix toggle<CR>";
        noremap = true;
        silent = true;
        desc = "Quickfix list (Trouble)";
      };
      "]d" = {
        action = "<cmd>lua vim.diagnostic.goto_next()<CR>";
        noremap = true;
        silent = true;
        desc = "Next diagnostic";
      };
      "[d" = {
        action = "<cmd>lua vim.diagnostic.goto_prev()<CR>";
        noremap = true;
        silent = true;
        desc = "Previous diagnostic";
      };
      "<leader>cd" = {
        action = "<cmd>lua vim.diagnostic.open_float()<CR>";
        noremap = true;
        silent = true;
        desc = "Line diagnostics";
      };

      # Inlay hints toggle
      "<leader>ch" = {
        action = "<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>";
        noremap = true;
        silent = true;
        desc = "Toggle inlay hints";
      };
    };
  };
}
