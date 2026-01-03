{ config, pkgs, ... }:

{
    imports = [
        ./common.nix
        ./desktop.nix
    ];

    home.username = "thiollier";
    home.homeDirectory = "/home/thiollier";
}
