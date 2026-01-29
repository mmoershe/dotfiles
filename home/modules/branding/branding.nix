{ config, pkgs, lib, hostname, ... }:

{
   home.file = {
        ".config/nixos_branding.txt".source = ./nixos_branding.txt;
        ".config/rellanix_branding.txt".source = ./rellanix_branding.txt;
    };
}

