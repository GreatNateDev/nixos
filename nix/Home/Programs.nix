{ pkgs, ... }:
let
  actualUser = builtins.getEnv "SUDO_USER";
  user = if actualUser != "" then actualUser else builtins.getEnv "USER";
  env = import /home/${user}/.config/nixos/nix/env.nix;
in
{
  programs.zsh = {
    enable = true;
    shellAliases = {
      ns = "echo 'Rebuilding NixOS...' && sudo nixos-rebuild switch --flake $HOME/.config/nixos/nix --impure --quiet && echo Done!";
      cat = "lolcat";
      lcm = "sudo ip link set wlp0s20f3 down && sudo macchanger -r wlp0s20f3 && sudo ip link set wlp0s20f3 up";
      lcmp = "sudo ip link set wlp0s20f3 down && sudo macchanger -m 3e:30:12:6f:31:ec wlp0s20f3 && sudo ip link set wlp0s20f3 up";
      ba = "cat /sys/class/power_supply/BAT0/status && cat /sys/class/power_supply/BAT0/capacity";
      df = "duf";
      du = "dust";
      ls = "eza";
      ll = "eza -la";
      nup = "cd $HOME/.config/nixos/nix/ && nix flake update && ns";
      ngc = "sudo nix-collect-garbage -d && nix-collect-garbage -d && sudo nix-store --gc && nix-store --gc";
      nce = "nix-env -q | fzf --multi | xargs -r nix-env -e";
      cfg = "zeditor ~/.config/nixos/";
      gitbk = "zsh $HOME/.config/nixos/scripts/gitbk.sh";
    };
    initContent = ''
      fastfetch
      rm -df ~/Downloads
      source ${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
      source ${pkgs.zsh-syntax-highlighting}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
      source ${pkgs.zsh-history-substring-search}/share/zsh-history-substring-search/zsh-history-substring-search.zsh
      source ${pkgs.fzf}/share/fzf/key-bindings.zsh
      source ${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh
      source $HOME/.config/nixos/data/zsh/p10k.zsh
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
        opacity = 0.85;
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
      "gdscript"
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

  programs.librewolf = {
    enable = true;
    profiles.default = {
      id = 0;
      bookmarks = {
        force = true;
        settings = [
          {
            name = "Nate's Pages";
            toolbar = true;
            bookmarks = [
              {
                name = "Github Profile";
                url = "https://github.com/GreatNateDev";
              }
              {
                name = "Nix Packages";
                url = "https://mynixos.com/";
              }
              {
                name = "Ip Address";
                url = "https://whatismyipaddress.com/";
              }
              {
                name = "Download GitHub Folders";
                url = "https://download-directory.github.io/";
              }
              {
                name = "AI-Weak";
                url = "https://chatgpt.com/";
              }
              {
                name = "Ai-Strong";
                url = "https://claude.ai/";
              }
              {
                name = "YouTube";
                url = "https://www.youtube.com/";
              }
              {
                name = "Kick";
                url = "https://kick.com/";
              }
              {
                name = "Twitch";
                url = "https://www.twitch.tv/";
              }
              {
                name = "OSU!";
                url = "https://osu.ppy.sh/";
              }
              {
                name = "Home-Manager Options";
                url = "https://nix-community.github.io/home-manager/options.xhtml";
              }
            ];
          }
        ];
      };
      settings = {
        "privacy.resistFingerprinting" = false;
        "browser.policies.runOncePerModification.setDefaultSearchEngine" = "StartPage";
        "browser.search.separatePrivateDefault" = false;
        "privacy.clearHistory.formdata" = true;
        "privacy.clearHistory.siteSettings" = true;
        "privacy.clearOnShutdown.downloads" = true;
        "privacy.clearOnShutdown.history" = true;
        "privacy.clearOnShutdown.offlineApps" = true;
        "privacy.clearOnShutdown.openWindows" = true;
        "privacy.clearOnShutdown.siteSettings" = true;
        "privacy.clearOnShutdown_v2.browsingHistoryAndDownloads" = true;
        "privacy.clearOnShutdown_v2.formdata" = true;
        "privacy.clearOnShutdown_v2.historyFormDataAndDownloads" = true;
        "privacy.clearOnShutdown_v2.siteSettings" = true;
        "privacy.clearSiteData.browsingHistoryAndDownloads" = true;
        "privacy.clearSiteData.formdata" = true;
        "privacy.clearSiteData.historyFormDataAndDownloads" = true;
        "privacy.clearSiteData.siteSettings" = true;
        "browser.search.defaultenginename" = "StartPage";
        "browser.search.order.1" = "StartPage";
        "browser.search.selectedEngine" = "StartPage";
        "browser.urlbar.placeholderName" = "StartPage";
        "browser.toolbars.bookmarks.visibility" = "always";
      };
    };
    policies = {
      SearchEngines = {
        Default = "StartPage";
        Remove = [
          "Google"
          "Bing"
        ];
      };
      DownloadDirectory = "/home/${env.username}";
      PromptForDownloadLocation = false;
      DefaultDownloadDirectory = "/home/${env.username}";
    };
  };
  programs.waybar = {
    enable = true;
  };
}
