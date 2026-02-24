{pkgs, ...}: {
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
}
