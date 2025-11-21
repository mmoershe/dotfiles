{ pkgs, ... }:

let
    my-scripts = with pkgs; [
        (writeShellScriptBin "clone-nvim"      (builtins.readFile ./scripts/clone_nvim_config.sh))
        (writeShellScriptBin "check-display-server" (builtins.readFile ./scripts/check_display_server.sh))
    ];

in
{
    environment.systemPackages = my-scripts;
}
