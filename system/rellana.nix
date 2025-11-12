{ config, pkgs, ... }:

{

    # Install firefox.
    programs.firefox.enable = true;

    environment.systemPackages = with pkgs; [
        neovim
        thunderbird
        wofi
        chromium
        discord
        vscodium
    ];
}
