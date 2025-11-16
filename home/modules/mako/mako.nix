{ config, pkgs, ... }:

{
    home.packages = with pkgs; [
        libnotify
        mako
    ];
}
