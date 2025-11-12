{ config, pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        vim
        wget
        fastfetch
        git
        gh
        lazygit
        bat
        fzf
        python3
    ];


    # Configure console keymap
    console.keyMap = "de";

    # Enable CUPS to print documents.
    services.printing.enable = true;

    # Enable sound with pipewire.
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        # If you want to use JACK applications, uncomment this
        #jack.enable = true;

        # use the example session manager (no others are packaged yet so this is enabled by default,
        # no need to redefine it in your config for now)
        #media-session.enable = true;
    };

    # Enable touchpad support (enabled default in most desktopManager).
    # services.xserver.libinput.enable = true;

    # Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    nixpkgs.config.allowUnfree = true;

    system.stateVersion = "25.05";
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
