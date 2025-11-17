{ config, pkgs, ... }:

{
    imports = [
        ./common.nix
        ./desktop.nix
    ];

    home.username = "rellana";
    home.homeDirectory = "/home/rellana";
}
