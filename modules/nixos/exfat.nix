{pkgs, ...}: {
  boot.supportedFilesystems = ["exfat"];
  environment.systemPackages = [pkgs.exfatprogs];
}
