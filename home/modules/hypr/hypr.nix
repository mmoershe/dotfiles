{ config, pkgs, lib, ... }:

let
  hyprConfigDir = ".config/hypr";
in
{
  home.file."${hyprConfigDir}/hyprland.conf".source = ./hyprland.conf;
  home.file."${hyprConfigDir}/monitor.conf".source  = ./monitor.conf;
  home.file."${hyprConfigDir}/bindings.conf".source  = ./bindings.conf;
}

