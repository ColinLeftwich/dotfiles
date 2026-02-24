{pkgs, ...}: {
  home.sessionPath = [
    "${pkgs.starship}/bin"
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    initContent = ''
      function y() {
        local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
        yazi "$@" --cwd-file="$tmp"
        IFS= read -r -d $'\0' cwd < "$tmp"
        [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
        rm -f -- "$tmp"
      }
    '';

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
    package = pkgs.starship;
  };
}
