{ config, pkgs, ... }:

{
    imports = [
        ./modules/bash/bash.nix
    ];

    home.packages = with pkgs; [
        hello
    ];

    home.stateVersion = "25.11";
    programs.home-manager.enable = true;
}
