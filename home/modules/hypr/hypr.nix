{ config, pkgs, lib, ... }:

let
    hyprConfigDir = ".config/hypr";
in
{
    home.file = {
        "${hyprConfigDir}/hyprland.conf".source = ./hyprland.conf;
        "${hyprConfigDir}/monitor.conf".source  = ./monitor.conf;
        "${hyprConfigDir}/bindings.conf".source  = ./bindings.conf;
        "${hyprConfigDir}/autostart.conf".source  = ./autostart.conf;
    };
}

