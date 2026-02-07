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
        starship
        zstd
        gimp
        dl-librescore
        firefox-devedition
        chromium
        qbittorrent
        claude-code
        claude-monitor
        copilot-cli
        filezilla
        texliveTeTeX
        (python313.withPackages (ps: with ps; [
            beautifulsoup4
            pandas
            requests
            tqdm
        ]))
    ];

    programs = {
        localsend.enable = true;
        firefox.enable = true;
        thunderbird.enable = true;
        thunar.enable = true;
        hyprland.enable = true;
        lazygit.enable = true;
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
