{ config, pkgs, lib, ... }:

{
    home.packages = with pkgs; [
        rose-pine-cursor
        catppuccin-cursors.mochaMauve
    ];

    dconf.settings = {
        "org/gnome/desktop/input-sources" = {
            xkb-options = ["caps:escape"];
        };
        "org/gnome/desktop/interface" = {
            clock-show-weekday = false;
            color-scheme = "prefer-dark";
            gtk-theme = "Dracula";
            cursor-theme = "catppuccin-mocha-mauve-cursors";
        };
        "org/gnome/mutter" = {
            experimental-features = [ "scale-monitor-framebuffer" ];
        };
    };
}
