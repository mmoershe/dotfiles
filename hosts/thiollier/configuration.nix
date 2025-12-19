{ config, pkgs, ... }:

{
    imports = [
        /etc/nixos/hardware-configuration.nix
        # <home-manager/nixos>
        ./../../system/common.nix
        ./../../system/thiollier.nix
        ./../../system/scripts.nix
    ];
}
