{ config, pkgs, lib, ... }:

{
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
    ];

    programs = {
        neovim.enable = true;
    };
}

