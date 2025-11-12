{ config, pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        vim
        wget
        fastfetch
        git
        gh
        lazygit
        bat
        fzf
        python3
    ];

    nixpkgs.config.allowUnfree = true;
    system.stateVersion = "25.05";
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
