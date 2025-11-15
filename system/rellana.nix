{ config, pkgs, ... }:

{

    # Install firefox.
    programs.firefox.enable = true;

    hardware.bluetooth.enable = true;
    services.blueman.enable = true;

    environment.systemPackages = with pkgs; [
        neovim
        thunderbird
        wofi
        chromium
        discord
        vscodium
        starship
        libreoffice-still
    ];
}
