{ config, pkgs, ... }:

{
    home.packages = with pkgs; [
        hello
    ];

    home.stateVersion = "25.05";
    programs.home-manager.enable = true;
}
