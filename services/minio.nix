{config, ...}: {
  # Root credentials via sops
  sops.secrets."minio/root_user" = {};
  sops.secrets."minio/root_password" = {};

  sops.templates."minio-credentials".content = ''
    MINIO_ROOT_USER=${config.sops.placeholder."minio/root_user"}
    MINIO_ROOT_PASSWORD=${config.sops.placeholder."minio/root_password"}
  '';

  services.minio = {
    enable = true;
    rootCredentialsFile = config.sops.templates."minio-credentials".path;
    browser = true;
  };

  networking.firewall.allowedTCPPorts = [9000 9001];
}
