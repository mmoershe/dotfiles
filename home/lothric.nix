{ config, pkgs, ... }:

{
    imports = [
        ./common.nix
        ./desktop.nix
    ];

    home.username = "lothric";
    home.homeDirectory = "/home/lothric";
}
