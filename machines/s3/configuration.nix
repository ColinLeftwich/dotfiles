{inputs, ...}: {
  imports = [
    inputs.home-manager.nixosModules.default
    inputs.sops-nix.nixosModules.sops

    ./hardware-configuration.nix

    ../../modules/nixos/base.nix
    # ../../modules/nixos/auto-upgrade.nix
    # ../../modules/nixos/exfat.nix

    ../../services/minio.nix
  ];

  # Bootloader (legacy BIOS/GRUB)
  boot.loader.systemd-boot.enable = false;
  boot.loader.efi.canTouchEfiVariables = false;
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.colin = {
      imports = [
        ../../modules/home-manager/base.nix
        ../../modules/home-manager/shells.nix
        ../../modules/home-manager/git.nix
      ];
    };
  };

  networking.hostName = "s3";
}
