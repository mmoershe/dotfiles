{ config, pkgs, lib, ... }:

{
  home.file.".config/nvim".source = ./config.nvim;
}


