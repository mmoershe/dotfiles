{ config, pkgs, ... }:

{

    programs.firefox.enable = true;
    programs.thunar.enable = true;

    hardware.bluetooth.enable = true;

    services.blueman.enable = true;

    environment.systemPackages = with pkgs; [
        rose-pine-hyprcursor
        neovim
        thunderbird
        chromium
        discord
        whatsie
        vscodium
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
        clipgrab
        localsend
        terminaltexteffects
        teams-for-linux
    ];

    # Display Manager
    services.displayManager.ly = {
        enable = true;
        package = pkgs.ly;
        settings = {
        hide_borders = false;
        animation = "matrix";
        };
    };

    # (Dis/En)able the X11 windowing system.
    services.xserver.enable = true;
    services.xserver.desktopManager.gnome.enable = true;

    # Hyprland stuff
    programs.hyprland.enable = true;

    # Configure keymap in X11
    services.xserver.xkb = {
        layout = "de";
        variant = "";
    };
}
