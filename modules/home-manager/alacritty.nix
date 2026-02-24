{
  programs.alacritty = {
    enable = true;
    theme = "github_dark_high_contrast";
    settings = {
      font = {
        size = 20.0;
        normal = {
          family = "MesloLGSDZ Nerd Font";
          style = "Regular";
        };
      };

      terminal.shell = "zsh";
      env.shell = "zsh";
    };
  };
}
