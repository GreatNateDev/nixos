{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    shellAliases = {
      ns = "echo 'Rebuilding NixOS...' && sudo nixos-rebuild switch --flake $HOME/.config/nixos/nix --impure --quiet && echo Done!";
      nd = "sudo nix-env -p /nix/var/nix/profiles/system --delete-generations +5";
      nup = "nix flake update $HOME/.config/nixos/nix/";
      cat = "bat";
      lcm = "sudo ip link set wlp0s20f3 down && sudo macchanger -r wlp0s20f3 && sudo ip link set wlp0s20f3 up";
      lcmp = "sudo ip link set wlp0s20f3 down && sudo macchanger -m 3e:30:12:6f:31:ec wlp0s20f3 && sudo ip link set wlp0s20f3 up";
      ba = "cat /sys/class/power_supply/BAT0/status && cat /sys/class/power_supply/BAT0/capacity";
      df = "duf";
      du = "dust";
      ls = "eza";
      ll = "eza -la";
      nus = "cd /home/nate/.config/nixos/nix/ && nix flake update && ns";
      ngc = "nix-collect-garbage";
      nce = "nix-env -q | fzf --multi | xargs -r nix-env -e";
      cfg = "nvim ~/.config/nixos/nix/";
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
  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
      "toml"
      "HTML"
      "catppuccin"
      "catppuccin-icons"
    ];
    userSettings = {
      theme = {
        mode = "dark";
        dark = "Catppuccin Mocha";
        light = "Catppuccin Mocha";
      };
      icon_theme = "Catppuccin Mocha";
      lsp = {
        nixd = {
          initialization_options = {
            formatting = {
              command = [ "nixfmt" ];
            };
          };
        };
      };
      languages = {
        Nix = {
          language_servers = [
            "nixd"
            "!nil"
          ];
        };
      };
    };
  };
  programs.chromium = {
    enable = true;
    package = pkgs.brave;

    # Extensions - use Chrome Web Store IDs
    extensions = [
      { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } # uBlock Origin
      { id = "nngceckbapebfimnlniiiahkandclblb"; } # Bitwarden
      { id = "eimadpbcbfnmbkopoojfekhnkhdbieeh"; } # Dark Reader
      # Add more extension IDs here
    ];
  };

  # Bookmarks configuration
  home.file.".config/BraveSoftware/Brave-Browser/Default/Bookmarks".text = builtins.toJSON {
    checksum = "0000000000000000000000000000000000000000";
    roots = {
      bookmark_bar = {
        children = [
          {
            name = "Download Directory";
            type = "url";
            url = "https://download-directory.github.io/";
          }
          {
            name = "MyNixOS";
            type = "url";
            url = "https://mynixos.com/";
          }
          {
            name = "GreatNateDev";
            type = "url";
            url = "https://github.com/GreatNateDev";
          }
        ];
        name = "Bookmarks bar";
        type = "folder";
      };
      other = {
        children = [ ];
        name = "Other bookmarks";
        type = "folder";
      };
      synced = {
        children = [ ];
        name = "Mobile bookmarks";
        type = "folder";
      };
    };
    version = 1;
  };

  # Main Preferences file with all settings
 

    # Privacy & Clear browsing data on exit
    browser = {
      clear_lso_data_enabled = true;
      clear_data = {
        browsing_history = true;
        cookies = true;
        cache = true;
        download_history = true;
        form_data = true;
        hosted_apps_data = true;
        passwords = true;
        time_period = 4; # Everything
      };
      show_home_button = true;
      check_default_browser = false;
    };

    # Profile settings
    profile = {
      cookie_controls_mode = 1; # Block third-party cookies
      password_manager_enabled = false;

      # Content settings exceptions for github.com
      content_settings = {
        exceptions = {
          cookies = {
            "https://github.com:443,*" = {
              last_modified = "13334071393000000";
              setting = 1; # Allow
            };
            "[*.]github.com:443,*" = {
              last_modified = "13334071393000000";
              setting = 1; # Allow
            };
          };
        };
      };
    };

    safebrowsing = {
      enabled = true;
      scout_reporting_enabled = false;
    };

    # Brave-specific settings
    brave = {
      brave_ads = {
        enabled = false;
      };
      rewards = {
        enabled = false;
      };
      shields = {
        enabled = true;
      };
      stats = {
        reporting_enabled = false;
      };
    };

    # Search engine - Startpage
    default_search_provider = {
      enabled = true;
      search_url = "https://www.startpage.com/sp/search?query={searchTerms}";
      name = "Startpage";
      keyword = "startpage.com";
    };

    # Appearance
    extensions = {
      ui = {
        developer_mode = true;
      };
    };

    # Downloads
    download = {
      default_directory = "/home/nate";
      prompt_for_download = false;
    };

    # Additional privacy settings
    enable_do_not_track = true;
    alternate_error_pages = {
      enabled = false;
    };
    search = {
      suggest_enabled = false;
    };
    translate = {
      enabled = false;
    };
    signin = {
      allowed = false;
    };
  };

  # Local State file (for additional settings)
  home.file.".config/BraveSoftware/Brave-Browser/Local State".text = builtins.toJSON {
    brave = {
      stats = {
        reporting_enabled = false;
      };
    };
  };
}
