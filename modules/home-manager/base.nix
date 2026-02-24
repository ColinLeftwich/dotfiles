{
  config,
  pkgs,
  ...
}: {
  home.username = "colin";
  home.homeDirectory = "/home/colin";
  home.stateVersion = "25.05";

  programs.home-manager.enable = true;
}
