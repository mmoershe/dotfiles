{ config, pkgs, ... }:

{
    home.packages = with pkgs; [
        libnotify
        mako
    ];

    home.file = {
        ".config/mako/config".source = ./config;
    };
}
