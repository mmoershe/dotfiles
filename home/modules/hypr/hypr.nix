{ config, pkgs, lib, hostname, ... }:

let
    hyprConfigDir = ".config/hypr";

    overrideFile =
        if hostname == "rellana" then ./override-rellana.conf
        else if hostname == "lothric" then ./override-lothric.conf
        else if hostname == "thiollier" then ./override-thiollier.conf
        else ./override.conf;

    hyprpaperDirectory = 
        if hostname == "thiollier" then ./hyprpaper-thiollier.conf
        else ./hyprpaper.conf;
in
{
    home.packages = with pkgs; [
        hyprpaper
        hypridle
        hyprlock
        hyprcursor
        hyprshot
    ];

    home.file = {
        "${hyprConfigDir}/hyprland.conf".source = ./hyprland.conf;
        "${hyprConfigDir}/bindings.conf".source  = ./bindings.conf;
        "${hyprConfigDir}/autostart.conf".source  = ./autostart.conf;
        "${hyprConfigDir}/looknfeel.conf".source  = ./looknfeel.conf;
        "${hyprConfigDir}/hypridle.conf".source = ./hypridle.conf;
        "${hyprConfigDir}/hyprlock.conf".source = ./hyprlock.conf;
        "${hyprConfigDir}/hyprpaper.conf".source = hyprpaperDirectory;
        "${hyprConfigDir}/override.conf".source  = overrideFile;
    };
}

