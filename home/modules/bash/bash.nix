{ config, pkgs, lib, ... }:

{
    home.file.".bashrc".source = ./.bashrc;
}

