{ pkgs, ... }:

{
  # Your username and home directory
  home.username = "nate";
  home.homeDirectory = "/home/nate";

  # Track Home Manager version (use unstable or match your nixpkgs version)
  home.stateVersion = "25.11";

  # Enable basic programs
  #programs.zsh.enable = true;
  #programs.git.enable = true;

  # Packages to install in the user environment
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    brave
    alacritty
    xwayland-satellite
    fuzzel
    vscodium
    gh
    swaylock
    python3
    nautilus
    fastfetch
    htop
    osu-lazer-bin
    waybar
    supersonic
    quakespasm
    prismlauncher
    zsh-powerlevel10k
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-completions
    zsh-history-substring-search
    zsh-fzf-tab
    fzf
    openjdk21
    yt-dlp
    exiftool
    id3v2
    steam
  ];
  programs.zsh = {
    enable = true;
    shellAliases = {
      ns = "sudo nixos-rebuild switch --flake $HOME/.config/nixos --impure";
      nd = "sudo nix-env -p /nix/var/nix/profiles/system --delete-generations +5";
    };
    initContent = ''
      # fastfetch
      fastfetch
      # Plugins
      source ${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
      source ${pkgs.zsh-syntax-highlighting}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
      source ${pkgs.zsh-history-substring-search}/share/zsh-history-substring-search/zsh-history-substring-search.zsh
      # fzf + fzf-tab
      source ${pkgs.fzf}/share/fzf/key-bindings.zsh
      source ${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh
      source /home/nate/.config/nixos/data/zsh/p10k.zsh
    '';
    oh-my-zsh = {
      enable = true;
      theme = "powerlevel10k"; # just the theme name
      custom = "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k";
      plugins = [
        "git"
        "docker"
        "zsh-interactive-cd"
      ];
    };
  };
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      catppuccin.catppuccin-vsc
      arrterian.nix-env-selector
      jnoortheen.nix-ide
      rust-lang.rust-analyzer
      ms-python.python
    ];
  };
  programs.chromium = {
    enable = true;
    package = pkgs.brave;
    extensions = [
      { id = "ddkjiahejlhfcafbddmgiahcphecmpfh"; } # ublock origin lite i dont think this works
    ];
    commandLineArgs = [
      ""
    ];
  };
  programs.fuzzel = {
    enable = true;
    settings = {
      colors = {
        background = "1e1e2edd";
        text = "cdd6f4ff";
        prompt = "bac2deff";
        placeholder = "7f849cff";
        input = "cdd6f4ff";
        match = "94e2d5ff";
        selection = "585b70ff";
        selection-text = "cdd6f4ff";
        selection-match = "94e2d5ff";
        counter = "7f849cff";
        border = "94e2d5ff";
      };

    };
  };
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        opacity = 0.5;
        decorations_theme_variant = "Dark";
      };
      font = {
        normal.family = "JetBrainsMono Nerd Font Mono";
        size = 11.0;
      };
    };
  };
  services.wpaperd = {
    enable = true;
    settings = {
      eDP-1 = {
        path = "/home/nate/.config/nixos/data/bg/";  
        duration = "20s";                            
      };
      HDMI-A-1 = {
      path = "/home/nate/.config/nixos/data/bg/";  
        duration = "20s";                            
      };
    };
  };
  home.file.".config/niri/config.kdl" = {
    source = ./data/niri/config.kdl; # relative to your home.nix
  };
  home.file.".config/waybar" = {
    source = ./data/waybar;
    recursive = true;
  };
  home.file.".config/nvim" = {
    source = ./data/nvim;
    recursive = true;
  };
}
