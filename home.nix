{ config, pkgs, ... }:

{
    programs.hyprland= {
        enable = true;
        xwayland.enable = true;
    };

    # Enable zsh
    programs.zsh = {
        enable = true;
        autosuggestions.enable = true;
        zsh-autoenv.enable = true;
        syntaxHighlighting.enable = true;
    };
    
    # Enable oh my zsh
    programs.zsh.ohMyZsh = {
        enable = true;
        theme = "robbyrussell";
        plugins = [
            "git"
            "npm"
            "history"
            "node"
            "rust"
            "deno"
        ];
    };

    programs.dconf.enable = true;

    # ADB
    programs.adb.enable = true;

    #set font
    fonts = {
        packages = with pkgs; [
            noto-fonts
            noto-fonts-cjk
            noto-fonts-emoji
            font-awesome
            source-han-sans
            source-han-sans-japanese
            source-han-serif-japanese
            (nerdfonts.override {fonts = ["Meslo"];})
        ];
        fontconfig = {
            enable = true;
            defaultFonts = {
                monospace = ["Meslo LG M Regular Nerd Font Complete Mono"];
                serif = ["Noto Serif" "Source Han Serif"];
                sansSerif = ["Noto Sans" "Source Han Sans"];
            };
        };
    };

    users.users.sahilsway = {
        isNormalUser = true;
        description = "Sahil Swargiary";
        extraGroups = [ "networkmanager" "wheel" "adbusers" "plugdev" ];
        packages = with pkgs; [
            zsh
            # oh-my-zsh
            kitty
            vlc
            docker_27
            firefox
        ];
        shell = pkgs.zsh;
    };


    home.packages = with pkgs; [
        tmux
        feh
        alacritty
        neovim
        wezterm
        android-studio
        discord
    ];


    # Zsh and Oh My Zsh
    users.defaultUserShell = pkgs.zsh;

    # Enable flakes
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    # Custom group for android usb access
    groups.plugdev = {};
}


