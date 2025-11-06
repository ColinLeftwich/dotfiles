{pkgs, ...}: {
  home.username = "colin";
  home.homeDirectory = "/home/colin";
  home.stateVersion = "25.05"; # Please read the comment before changing.
  fonts.fontconfig.enable = true;

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ls = "eza --group-directories-first --icons";
      cd = "z";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "vi-mode"
        "zoxide"
      ];
    };
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
    ];
    extraPackages = with pkgs; [
      nixd
    ];
  };

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
      # env.shell = "nu";
    };
  };

  # Packages
  home.packages = with pkgs; [
    vim
    neovim
    ranger
    gnupg

    git
    just
    alejandra

    zoxide
    eza
    nerd-fonts.meslo-lg

    wireshark
    kicad
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
