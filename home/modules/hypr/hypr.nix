{ config, pkgs, lib, ... }:

let
    hyprConfigDir = ".config/hypr";
in
{
    home.packages = with pkgs; [
        hyprpaper
        hypridle
        hyprlock
    ];

    home.file = {
        "${hyprConfigDir}/hyprland.conf".source = ./hyprland.conf;
        "${hyprConfigDir}/monitor.conf".source  = ./monitor.conf;
        "${hyprConfigDir}/bindings.conf".source  = ./bindings.conf;
        "${hyprConfigDir}/autostart.conf".source  = ./autostart.conf;
        "${hyprConfigDir}/looknfeel.conf".source  = ./looknfeel.conf;
        "${hyprConfigDir}/hypridle.conf".source = ./hypridle.conf;
        "${hyprConfigDir}/hyprlock.conf".source = ./hyprlock.conf;
        "${hyprConfigDir}/hyprpaper.conf".source = ./hyprpaper.conf;
        "Pictures/wallpapers/wallpaper_1.jpeg".source  = ./wallpaper_1.jpeg;
    };
}

