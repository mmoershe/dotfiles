{ config, pkgs, lib, ... }:

{
    home.packages = with pkgs; [
        alacritty
    ];

    home.file = {
        ".config/alacritty/screensaver.toml".source = ./screensaver.toml;
    };
}

