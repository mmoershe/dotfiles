{ config, pkgs, ... }:

{
    imports = [
        ./modules/bash/bash.nix
        ./modules/hypr/hypr.nix
        ./modules/nvim/nvim.nix
        ./modules/kitty/kitty.nix
        ./modules/waybar/waybar.nix
        ./modules/gtk/gtk.nix
        ./modules/qt/qt.nix
        ./modules/mako/mako.nix
        ./modules/wofi/wofi.nix
        ./modules/branding/branding.nix
    ];

    home.packages = with pkgs; [
        nerd-fonts.jetbrains-mono
        wl-clipboard
    ];
}
