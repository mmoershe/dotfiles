{ config, pkgs, lib, hostname, ... }:

let
    brandingFile =
        if hostname == "rellana" then ./branding-rellana.txt
        else if hostname == "lothric" then ./branding-lothric.txt
        else ./branding.txt;
in
{
    home.file = {
        ".config/branding".source = brandingFile;
    };
}

