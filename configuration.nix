
{ config, pkgs, ... }:

{
    imports =
        [ # Include the results of the hardware scan.
        ./hardware-configuration.nix
    ];

    # Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    # Hostname.
    networking.hostName = "nixos";

    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    # Network Manager
    networking.networkmanager.enable = true;

    # Docker
    virtualisation.docker.enable = true;

    # Timezone.
    time.timeZone = "Indian/Reunion";

    # Locale
    i18n.defaultLocale = "en_US.UTF-8";

    i18n.extraLocaleSettings = {
        LC_ADDRESS = "en_US.UTF-8";
        LC_IDENTIFICATION = "en_US.UTF-8";
        LC_MEASUREMENT = "en_US.UTF-8";
        LC_MONETARY = "en_US.UTF-8";
        LC_NAME = "en_US.UTF-8";
        LC_NUMERIC = "en_US.UTF-8";
        LC_PAPER = "en_US.UTF-8";
        LC_TELEPHONE = "en_US.UTF-8";
        LC_TIME = "en_US.UTF-8";
    };

    security.rtkit.enable = true;

    # Allow unfree packages
    nixpkgs.config = {
        allowUnfree = true;
        allowInsecure = true;
    };

    # Enable sound with pipewire.
    hardware.pulseaudio.enable = false;

    # Enable OpenGL
    hardware.opengl.enable = true;
    
    # Load nvidia driver for Xorg and Wayland
    hardware.nvidia = {
        modesetting.enable = true;
        powerManagement.enable = false;
        powerManagement.finegrained = false;
        open = false;
        nvidiaSettings = true;
        package = config.boot.kernelPackages.nvidiaPackages.stable;
    };

    hardware.nvidia.prime = {
        offload.enable = true;
        offload.enableOffloadCmd = true;
        nvidiaBusId = "PCI:01:0:0";
        amdgpuBusId = "PCI:05:0:0";
        # intelBusId = "PCI:0:2:0";
    };

    # Configure keymap in X11
    services.xserver = {
        xkb.layout = "us";
        xkb.variant = "";
        enable = true;
        # windowManager.default = "hyperland";
        windowManager.i3.package = pkgs.i3-gaps;
        windowManager.i3.enable = true;
        # Enable touchpad support (enabled default in most desktopManager).
        # libinput.enable = true;
        videoDrivers = ["nvidia"];
    };

        # Display manager
    services.displayManager = {
        sddm.enable = true;
        # lightdm.enable = true; # or your preferred display manager
        # gdm.enable = true;
        # gnome.enable = true;
    };

    # Enable CUPS to print documents.
    services.printing.enable = true;

    # Pipewire
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

    # Bluetooth config
    # services.bluez = {
    #     enable = true;
    #     pipewire.enable = true;
    # };

    # Enable the OpenSSH daemon.
    services.openssh.enable = true;

    # $ nix search wget
    environment.systemPackages = with pkgs; [
        # vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
        # wget
        waybar
        home-manager
        vanilla-dmz
        xorg.xcursorthemes
        brightnessctl
        bluez
        xclip
        ripgrep
        zip
        unzip
        git
        gcc
        flatpak
        jdk17
        python3
        nodejs_22
        nodePackages.yarn
        prettierd
        pipewire
        alejandra
        ( let base = pkgs.appimageTools.defaultFhsEnvArgs; in pkgs.buildFHSUserEnv ( base // { name = "fhs"; targetPkgs = pkgs: (base.targetPkgs pkgs) ++ [pkgs.pkg-config]; profile = "export FHS=1"; runScript = "$SHELL"; extraOutputsToInstall = ["dev"];}))
    ];

    # Set env variables
    environment.variables = {
        XCURSOR_THEME = "Vanilla-DMZ";
        XCURSOR_SIZE = "24";
        # JAVA_HOME = "/path/to/your/jdk";
        ANDROID_HOME = "/home/sahilsway/Android/Sdk";
        ANDROID_SDK_ROOT = "/home/sahilsway/Android/Sdk";
        # PATH = [ "//home/sahilsway/Android/Sdk/tools" "/home/sahilsway/Android/Sdk/platform-tools" ] ++ lib.strings.toList (getEnv "PATH");
    };

    # Some programs need SUID wrappers, can be configured further or are
    # started in user sessions.
    # programs.mtr.enable = true;
    # programs.gnupg.agent = {
        # enable = true;
        # enableSSHSupport = true;
    # };

    # Open ports in the firewall.
    # networking.firewall.allowedTCPPorts = [ ... ];
    # networking.firewall.allowedUDPPorts = [ ... ];
    # Or disable the firewall altogether.
    # networking.firewall.enable = false;

    system.stateVersion = "24.05";

}

