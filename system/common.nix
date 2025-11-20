{ config, pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        bash
        file
        duf
        htop
        btop
        wget
        git
        gh
        bat
        fzf
        vim
        fastfetch
        python3
        lazygit
        openvpn
    ];

    # Enable networking
    networking.networkmanager.enable = true;
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    # Set your time zone.
    time.timeZone = "Europe/Berlin";

    # Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";

    i18n.extraLocaleSettings = {
        LC_ADDRESS = "de_DE.UTF-8";
        LC_IDENTIFICATION = "de_DE.UTF-8";
        LC_MEASUREMENT = "de_DE.UTF-8";
        LC_MONETARY = "de_DE.UTF-8";
        LC_NAME = "de_DE.UTF-8";
        LC_NUMERIC = "de_DE.UTF-8";
        LC_PAPER = "de_DE.UTF-8";
        LC_TELEPHONE = "de_DE.UTF-8";
        LC_TIME = "de_DE.UTF-8";
    };

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
    boot.loader.systemd-boot.enable = false;
    boot.loader.grub.enable = true;
    boot.loader.grub.efiSupport = true;
    boot.loader.grub.device = "nodev";
    boot.loader.grub = {
        minegrub-theme = {
            enable = true;
            splash = "100% Flakes!";
            background = "background_options/1.8  - [Classic Minecraft].png";
            boot-options-count = 4;
        };
    };
    boot.loader.efi.canTouchEfiVariables = true;
    nixpkgs.config.allowUnfree = true;

    system.stateVersion = "25.05";
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
