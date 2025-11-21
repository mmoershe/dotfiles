{ pkgs, ... }:

let
    my-scripts = with pkgs; [
        (writeShellScriptBin "clone-nvim"      (builtins.readFile ./scripts/clone_nvim_config.sh))
        (writeShellScriptBin "check-display-server" (builtins.readFile ./scripts/check_display_server.sh))
        (writeShellScriptBin "show-branding" (builtins.readFile ./scripts/show-branding.sh))
        (writeShellScriptBin "screensaver" (builtins.readFile ./scripts/screensaver.sh))
        (writeShellScriptBin "launch-screensaver" (builtins.readFile ./scripts/launch-screensaver.sh))
    ];

in
{
    environment.systemPackages = my-scripts;
}
