{config, ...}: {
  environment.etc."gitconfig".text = ''
    [safe]
        directory = /home/colin/dotfiles
  '';
  environment.etc."nixos".source = "/home/colin/dotfiles";

  system.autoUpgrade = {
    enable = true;
    allowReboot = true;
    dates = "03:00";
    flake = "/etc/nixos#${config.networking.hostName}";
  };
}
