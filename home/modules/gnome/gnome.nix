{ config, pkgs, lib, ... }:

{
    home.packages = with pkgs; [
        rose-pine-cursor
        catppuccin-cursors.mochaMauve
        gnome-shell-extensions
        gnomeExtensions.dash-to-dock
    ];

    programs.gnome-shell = {
        enable = true;
    };

    dconf.enable = true;

    dconf.settings = {
        "org/gnome/shell" = {
            disable-user-extensions = false;
            enabled-extensions = [
                "dash-to-dock@micxgx.gmail.com" 
            ];
        };
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
