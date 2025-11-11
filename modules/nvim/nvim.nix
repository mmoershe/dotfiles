{ config, pkgs, lib, ... }:

let
  nvimConfig = pkgs.runCommand "nvim-config" {} ''
    git clone https://github.com/mmoershe/config.nvim.git $out
  '';
in
{
  home.file.".config/nvim".source = nvimConfig;
}

