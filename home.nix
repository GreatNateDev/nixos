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
    brave
    alacritty
    xwayland-satellite
    fuzzel
    vscodium
    gh
    swaylock
    swaybg
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
  ];
  programs.zsh = {
    enable = true;
    shellAliases = {
      ns = "sudo nixos-rebuild switch --flake $HOME/.config/nixos";
    };
    initContent = ''
      fastfetch
      source /home/nate/.config/nixos/data/zsh/p10k.zsh
    '';
    oh-my-zsh = {
      enable = true;
      theme = "powerlevel10k"; # just the theme name
      custom = "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k";
      plugins = [
        "git"
        "docker"
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
    };
  };

  systemd.user.services.niri-wallpaper = {
    Unit = {
      Description = "Background changer";
      After = "network.target";
    };
    Service = {
      Type = "simple";
      ExecStart = "/run/current-system/sw/bin/zsh /home/nate/.config/nixos/data/niri/run.sh";
      Restart = "always";
    };
    Install = {
      WantedBy = [ "multiuser.target" ];
    };
  };
  home.file.".config/niri/config.kdl" = {
    source = ./data/niri/config.kdl; # relative to your home.nix
  };
  home.file.".config/waybar" = {
    source = ./data/waybar;
  };
}
