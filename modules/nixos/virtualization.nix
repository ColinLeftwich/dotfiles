{...}: {
  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = ["colin"];
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
}
