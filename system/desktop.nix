{ config, pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        rose-pine-hyprcursor
        discord
        zapzap
        libreoffice-still
        bitwarden-desktop
        nautilus
        spotify
        pavucontrol
        brightnessctl
        mongodb-compass
        feh
        ytdownloader
        terminaltexteffects
        teams-for-linux
        opencode
        zstd
        gimp
        firefox-devedition
        chromium
        qbittorrent
    ];

    programs = {
        starship.enable = true;
        localsend.enable = true;
        neovim.enable = true;
        firefox.enable = true;
        thunderbird.enable = true;
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
        libinput.enable = true;
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
