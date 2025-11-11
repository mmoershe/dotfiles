{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "rellana";
  home.homeDirectory = "/home/rellana";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.05";

  home.packages = [
    pkgs.hello
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # DOTFILES

  home.file.".config/hypr/hyprland.conf".source = ./hypr/hyprland.conf;
  home.file.".config/hypr/monitor.conf".source = ./hypr/monitor.conf;

  programs.bash.enable = true;
}
