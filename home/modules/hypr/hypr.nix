{ config, pkgs, lib, hostname, ... }:

let
    hyprConfigDir = ".config/hypr";

    overrideFile =
        if hostname == "rellana" then ./override-rellana.conf
        else if hostname == "lothric" then ./override-lothric.conf
        else ./override.conf;
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
        "${hyprConfigDir}/override.conf".source  = overrideFile;
        "${hyprConfigDir}/bindings.conf".source  = ./bindings.conf;
        "${hyprConfigDir}/autostart.conf".source  = ./autostart.conf;
        "${hyprConfigDir}/looknfeel.conf".source  = ./looknfeel.conf;
        "${hyprConfigDir}/hypridle.conf".source = ./hypridle.conf;
        "${hyprConfigDir}/hyprlock.conf".source = ./hyprlock.conf;
        "${hyprConfigDir}/hyprpaper.conf".source = ./hyprpaper.conf;
        "Pictures/wallpapers/wallpaper_1.jpeg".source  = ./wallpaper_1.jpeg;
    };
}

