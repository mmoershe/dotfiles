
{ config, pkgs, lib, hostname, ... }:

let
    wallpapersDirectory= "Pictures/wallpapers";
in
{
    home.file = {
        "${wallpapersDirectory}/wallpaper_andor1.jpeg".source = ./wallpaper_andor1.jpeg;
        "${wallpapersDirectory}/wallpaper_dracula1.png".source = ./wallpaper_dracula1.png;
    };
}

