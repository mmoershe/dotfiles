{ config, pkgs, lib, ... }:

{
    home.packages = with pkgs; [
        kitty
    ];

    home.file = {
        ".config/kitty/kitty.conf".source = ./kitty.conf;
        ".config/kitty/cherry_midnight.conf".source = ./cherry_midnight.conf;
    };
}

