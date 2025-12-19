{ config, pkgs, ... }:

{
    imports = [
        ./common.nix
        ./desktop.nix
    ];

    home.packages = with pkgs; [
        slack
    ];

    home.username = "thiollier";
    home.homeDirectory = "/home/thiollier";
}
