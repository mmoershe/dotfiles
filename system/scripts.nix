{ pkgs, ... }:

let
    my-scripts = with pkgs; [
        (writeShellScriptBin "rellanix-nvim"      (builtins.readFile ./scripts/clone-nvim-config.sh))
        (writeShellScriptBin "rellanix-display-server" (builtins.readFile ./scripts/check-display-server.sh))
        (writeShellScriptBin "rellanix-branding" (builtins.readFile ./scripts/show-branding.sh))
        (writeShellScriptBin "rellanix-screensaver" (builtins.readFile ./scripts/screensaver.sh))
        (writeShellScriptBin "rellanix-launch-screensaver" (builtins.readFile ./scripts/launch-screensaver.sh))
        (writeShellScriptBin "rellanix-lock-screen" (builtins.readFile ./scripts/lock-screen.sh))
        (writeShellScriptBin "rellanix" (builtins.readFile ./scripts/nix-commands.sh))
    ];

in
{
    environment.systemPackages = my-scripts;
}
