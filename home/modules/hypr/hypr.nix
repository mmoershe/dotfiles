{ config, pkgs, lib, hostname, ... }:

let
    hyprConfigDir = ".config/hypr";

    monitorFile =
        if hostname == "rellana" then ./monitor-rellana.conf
        else if hostname == "lothric" then ./monitor-lothric.conf
        else ./monitor.conf;
in
{
    home.packages = with pkgs; [
        hyprpaper
        hypridle
        hyprlock
    ];

    home.file = {
        "${hyprConfigDir}/hyprland.conf".source = ./hyprland.conf;
        "${hyprConfigDir}/monitor.conf".source  = monitorFile;
        "${hyprConfigDir}/bindings.conf".source  = ./bindings.conf;
        "${hyprConfigDir}/autostart.conf".source  = ./autostart.conf;
        "${hyprConfigDir}/looknfeel.conf".source  = ./looknfeel.conf;
        "${hyprConfigDir}/hypridle.conf".source = ./hypridle.conf;
        "${hyprConfigDir}/hyprlock.conf".source = ./hyprlock.conf;
        "${hyprConfigDir}/hyprpaper.conf".source = ./hyprpaper.conf;
        "Pictures/wallpapers/wallpaper_1.jpeg".source  = ./wallpaper_1.jpeg;
    };
}

