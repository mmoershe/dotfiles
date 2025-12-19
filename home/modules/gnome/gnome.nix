{ config, pkgs, lib, ... }:

{
    programs.dconf.enable = true;

    dconf.settings = {
        "org/gnome/desktop/input-sources" = {
        xkb-options = ["caps:escape"];
    };
};

