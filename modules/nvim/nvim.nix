{ config, pkgs, lib, ... }:

let
  nvimConfig = builtins.fetchGit {
    url = "https://github.com/mmoershe/config.nvim.git";
  };
in
{
  home.file.".config/nvim".source = nvimConfig;
}

