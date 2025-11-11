{ config, pkgs, lib, ... }:

let
  nvimConfig = pkgs.fetchgit {
    url = "https://github.com/mmoershe/config.nvim.git";
    leaveUnspecifiedSha256 = true;
  };
in
{
  home.file.".config/nvim".source = nvimConfig;
}

