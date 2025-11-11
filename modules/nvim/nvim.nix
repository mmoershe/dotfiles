{ config, pkgs, lib, ... }:

let
  nvimConfig = pkgs.fetchgit {
    url = "https://github.com/mmoershe/config.nvim.git";
  };
in
{
  home.file.".config/nvim".source = nvimConfig;
}

