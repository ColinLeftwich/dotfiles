{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = [pkgs.restic];

  sops.secrets = {
    "minio/root_user" = {};
    "minio/root_password" = {};
    "restic/password" = {};
  };

  sops.templates."minio-env".content = ''
    AWS_ACCESS_KEY_ID=${config.sops.placeholder."minio/root_user"}
    AWS_SECRET_ACCESS_KEY=${config.sops.placeholder."minio/root_password"}
  '';

  services.restic.backups.documents = {
    repository = "s3:http://192.168.1.166:9000/documents";
    paths = ["/home/colin/Documents/"];
    passwordFile = config.sops.secrets."restic/password".path;
    environmentFile = config.sops.templates."minio-env".path;
    timerConfig.OnCalendar = "daily";
    pruneOpts = [
      "--keep-daily 7"
      "--keep-weekly 4"
      "--keep-monthly 6"
    ];
  };
}
