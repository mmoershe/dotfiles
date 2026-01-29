{ config, pkgs, ... }:

{
    imports = [
        ./modules/wallpapers/wallpapers.nix
        ./modules/bash/bash.nix
        ./modules/hypr/hypr.nix
        ./modules/nvim/nvim.nix
        ./modules/kitty/kitty.nix
        ./modules/alacritty/alacritty.nix
        ./modules/waybar/waybar.nix
        ./modules/gtk/gtk.nix
        ./modules/qt/qt.nix
        ./modules/mako/mako.nix
        ./modules/wofi/wofi.nix
        ./modules/branding/branding.nix
        ./modules/codium/codium.nix
        ./modules/gnome/gnome.nix
    ];

    home.packages = with pkgs; [
        nerd-fonts.jetbrains-mono
        wl-clipboard
    ];
}
