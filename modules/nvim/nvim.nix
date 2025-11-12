{ config, pkgs, lib, ... }:

{
    home.packages = with pkgs; [
        neovim
        gcc
        gnumake
        nodejs
        luarocks
        lua5_1
        ripgrep
        fd
        unzip
        mermaid-cli
    ];
}

