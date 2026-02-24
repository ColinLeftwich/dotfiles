{pkgs, ...}: {
  programs.obs-studio = {
    enable = true;

    package = (
      pkgs.obs-studio.override {
        cudaSupport = true;
      }
    );
  };
  # programs.obs-studio.enableVirtualCamera = true;
}
