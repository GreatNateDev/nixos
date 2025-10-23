{ ... }:
{
  xdg.desktopEntries.github = {
    name = "GitHub";
    exec = "chromium --app=https://github.com/";
    icon = "/home/nate/.config/nixos/data/XDG/GitHub.png";
  };
  xdg.desktopEntries.yazi = {
    name = "yazi";
    noDisplay = true;
  };
  xdg.desktopEntries.neovim = {
    name = "neovim";
    noDisplay = true;
  };
  xdg.desktopEntries.xterm = {
    name = "xterm";
    noDisplay = true;
  };
  xdg.desktopEntries.chromium-browser = {
    name = "Chromium";
    noDisplay = true;
  };
  xdg.desktopEntries.nixos-manual = {
    name = "Nixos Manual";
    noDisplay = true;
  };
  xdg.desktopEntries.nvim = {
    name = "nvim Wrapper";
    noDisplay = true;
  };
  xdg.desktopEntries.htop = {
    name = "htop";
    noDisplay = true;
  };
  xdg.desktopEntries.Alacritty = {
    name = "alacritty";
    noDisplay = true;
  };
}
