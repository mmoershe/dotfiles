{
  config,
  pkgs,
  lib,
  nvf,
  ...
}:

{
  imports = [
    nvf.homeManagerModules.default
    ./modules/editor-options.nix
    ./modules/theme.nix
    ./modules/languages.nix
    ./modules/plugins.nix
    ./modules/keymaps.nix
    ./modules/autocmd.nix
  ];

  programs.nvf = {
    enable = true;
    settings.vim = { };
  };

  home.packages = with pkgs; [
    tree-sitter
    gcc
    gnumake
    nodejs
    luarocks
    lua5_1
    ripgrep
    fd
    unzip
    mermaid-cli
    imagemagick
    trashy
    cargo
    marksman
    ghostscript
    tectonic
    pyright
    basedpyright
    ruff
  ];
}
