{ ... }:
{
  networking = {
    networkmanager.enable = true;
    firewall.enable = true;
    hosts = {
      "127.0.0.1" = [
        "jelly"
        "notify"
        "notes"
        "memos"
        "gpt"
        "weak"
        "fmhy"
        "account"
        "profile"
        "git"
        "osu"
      ];
    };
    nameservers = [
      "1.1.1.1"
      "1.0.0.1"
    ];
  };
}
