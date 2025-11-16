{ config, pkgs, ... }:

{
    imports = [
        ./common.nix
        ./modules/hypr/hypr.nix
        ./modules/nvim/nvim.nix
        ./modules/kitty/kitty.nix
        ./modules/waybar/waybar.nix
        ./modules/gtk/gtk.nix
        ./modules/qt/qt.nix
        ./modules/mako/mako.nix
        ./modules/wofi/wofi.nix
    ];

    home.username = "rellana";
    home.homeDirectory = "/home/rellana";

    home.packages = with pkgs; [
        nerd-fonts.jetbrains-mono
    ];
}
