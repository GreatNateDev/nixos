{ pkgs, ... }:

{
  home.username = "nate";
  home.homeDirectory = "/home/nate";
  home.stateVersion = "25.11";

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
    bat
    httpie
    viu
    file
    macchanger
    tldr
  ];

  programs.zsh = {
    enable = true;
    shellAliases = {
      ns = "sudo nixos-rebuild switch --flake $HOME/.config/nixos --impure";
      nd = "sudo nix-env -p /nix/var/nix/profiles/system --delete-generations +5";
      cat = "bat";
      lcm = "sudo ip link set wlp0s20f3 down && sudo macchanger -r wlp0s20f3 && sudo ip link set wlp0s20f3 up";
    };
    initContent = ''
      fastfetch
      source ${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
      source ${pkgs.zsh-syntax-highlighting}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
      source ${pkgs.zsh-history-substring-search}/share/zsh-history-substring-search/zsh-history-substring-search.zsh
      source ${pkgs.fzf}/share/fzf/key-bindings.zsh
      source ${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh
      source /home/nate/.config/nixos/data/zsh/p10k.zsh
    '';
    oh-my-zsh = {
      enable = true;
      theme = "powerlevel10k";
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
      { id = "ddkjiahejlhfcafbddmgiahcphecmpfh"; }
    ];
    commandLineArgs = [ "" ];
  };

  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        icon-theme = "candy-icons";
      };
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

  home.pointerCursor = {
    package = pkgs.catppuccin-cursors.mochaRed;
    name = "catppuccin-mocha-red-cursors";
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };

  gtk = {
    enable = true;
    theme = {
      name = "catppuccin-mocha-red-standard";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "red" ];
        variant = "mocha";
      };
    };
    iconTheme = {
      name = "candy-icons";
      package = pkgs.candy-icons;
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };

  home.sessionVariables.GTK_THEME = "catppuccin-mocha-red-standard";

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      gtk-theme = "catppuccin-mocha-red-standard";
      icon-theme = "candy-icons";
      cursor-theme = "catppuccin-mocha-red-cursors";
    };
  };

  home.file.".config/niri/config.kdl" = {
    source = ./data/niri/config.kdl;
  };
  home.file.".config/waybar" = {
    source = ./data/waybar;
    recursive = true;
  };
  home.file.".config/nvim" = {
    source = ./data/nvim;
    recursive = true;
  };
  home.file.".face".source = ./data/nate.png;
}
