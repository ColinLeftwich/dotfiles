{inputs, ...}: {
  imports = [
    inputs.home-manager.nixosModules.default
    inputs.sops-nix.nixosModules.sops

    ./hardware-configuration.nix

    ../../modules/nixos/base.nix
    ../../modules/nixos/hardware.nix
    ../../modules/nixos/desktop.nix
    ../../modules/nixos/virtualization.nix
    ../../modules/nixos/auto-upgrade.nix
    ../../modules/nixos/exfat.nix

    ../../services/restic.nix
  ];

  # Bootloader (EFI)
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernel.sysctl = {
    "kernel.yama.ptrace_scope" = 0;
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.colin = {
      imports = [
        ../../modules/home-manager/base.nix
        ../../modules/home-manager/packages.nix
        ../../modules/home-manager/shells.nix
        ../../modules/home-manager/alacritty.nix
        ../../modules/home-manager/zeditor.nix
        ../../modules/home-manager/git.nix
        ../../modules/home-manager/auto-upgrade-warning.nix
        ../../modules/home-manager/obs.nix
      ];
    };
  };

  networking.hostName = "workstation";
}
