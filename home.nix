{
  config,
  pkgs,
  ...
}: {
  home.username = "colin";
  home.homeDirectory = "/home/colin";

  home.stateVersion = "25.05"; # Please read the comment before changing.

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

  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
    ];
    extraPackages = with pkgs; [
      nixd
    ];
  };

  programs.git = {
    enable = true;
    settings.user = {
      name = "Colin Leftwich";
      email = "leftwichcolin@protonmail.com";
    };
  };

  home.packages = with pkgs; [
    vim
    neovim
    ranger
    curl
    tmux
    htop
    rsync

    fzf
    zoxide
    eza

    gnupg
    just
    nettools

    alejandra

    nerd-fonts.meslo-lg

    kdePackages.kate

    wireshark
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
