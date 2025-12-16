{ config, pkgs, lib, ... }:

{
    home.packages = with pkgs; [
        vscodium
    ];

    home.file.".config/VSCodium/User/keybindings.json".source = ./keybindings.json;
    home.file.".config/VSCodium/User/settings.json".source = ./settings.json;
}

