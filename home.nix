{
  config,
  pkgs,
  ...
}: {
  home.username = "colin";
  home.homeDirectory = "/home/colin";

  home.stateVersion = "25.05"; # Please read the comment before changing.

  systemd.user.services."auto-upgrade-warning" = {
    Unit = {
      Description = "Notify before system auto-upgrade";
    };

    Service = {
      Type = "oneshot";
      ExecStart = "${pkgs.libnotify}/bin/notify-send 'System update at 3:00 AM' 'NixOS will automatically update and may reboot.'";
    };
  };

  systemd.user.timers."auto-upgrade-warning" = {
    Unit = {
      Description = "Timer for auto-upgrade warning";
    };

    Timer = {
      OnCalendar = "02:55";
      Persistent = true;
    };

    Install = {
      WantedBy = ["timers.target"];
    };
  };

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
    libnotify

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
