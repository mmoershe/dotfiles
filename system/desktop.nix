{ config, pkgs, ... }:

{

    programs.firefox.enable = true;
    programs.thunar.enable = true;

    hardware.bluetooth.enable = true;

    services.blueman.enable = true;

    environment.systemPackages = with pkgs; [
        neovim
        thunderbird
        wofi
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
    ];
}
