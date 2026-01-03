{ config, pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        rose-pine-hyprcursor
        neovim
        thunderbird
        chromium
        discord
        zapzap
        starship
        libreoffice-still
        bitwarden-desktop
        nautilus
        spotify
        pavucontrol
        brightnessctl
        mongodb-compass
        feh
        ytdownloader
        localsend
        terminaltexteffects
        teams-for-linux
        opencode
        zstd
        gimp
        firefox-devedition
        qbittorrent
    ];

    programs = {
        firefox.enable = true;
        thunar.enable = true;
        hyprland.enable = true;
    };

    # Bluetooth
    hardware.bluetooth.enable = true;
    services.blueman.enable = true;

    # Display Manager
    services.displayManager.ly = {
        enable = true;
        package = pkgs.ly;
        settings = {
            hide_borders = false;
            animation = "matrix";
        };
    };

    services = {
        desktopManager.gnome.enable = true;
        xserver = {
            enable = false;
            xkb = {
                layout = "de";
                variant = "";
                options = "caps:escape";
            };
        };
    };
}
