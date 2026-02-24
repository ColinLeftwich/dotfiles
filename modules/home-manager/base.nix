{
  config,
  pkgs,
  ...
}: {
  home.username = "colin";
  home.homeDirectory = "/home/colin";
  home.stateVersion = "25.05";

  home.sessionVariables = {
    EDITOR = "zeditor";
  };

  programs.home-manager.enable = true;
}
