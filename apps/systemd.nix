{
  # Needs this line in /etc/fstab (one-time, root): mount.cifs only lets users mount fstab-listed paths.
  #   //fza-nas-01.sb-sk.local/FCS-BTS /home/lakatos/mnt/nas_01 cifs noauto,user,_netdev,credentials=/home/lakatos/.config/cifs-utils/.cifs-credentials-lakatos,uid=1000,gid=1000 0 0
  # The credentials file (chmod 600) holds username=, password= and optionally domain=.
  systemd.user.services = {
    mount-nas-01 = {
      Unit.Description = "Mount S&B network storage - NAS 01";
      Service = {
        Type = "oneshot";
        RemainAfterExit = true;
        ExecStartPre = "/usr/bin/mkdir -p %h/mnt/nas_01";
        ExecStart = "/usr/bin/mount %h/mnt/nas_01";
        ExecStop = "/usr/bin/umount %h/mnt/nas_01";
        Restart = "on-failure";
        RestartSec = 30;
      };
      Install.WantedBy = [ "default.target" ];
    };
  #   //fza-nas-02.sb-sk.local/Public /home/lakatos/mnt/nas_02 cifs noauto,user,_netdev,credentials=/home/lakatos/.config/cifs-utils/.cifs-credentials-lakatos,uid=1000,gid=1000 0 0
    mount-nas-02 = {
      Unit.Description = "Mount S&B network storage - NAS 02";
      Service = {
        Type = "oneshot";
        RemainAfterExit = true;
        ExecStartPre = "/usr/bin/mkdir -p %h/mnt/nas_02";
        ExecStart = "/usr/bin/mount %h/mnt/nas_02";
        ExecStop = "/usr/bin/umount %h/mnt/nas_02";
        Restart = "on-failure";
        RestartSec = 30;
      };
      Install.WantedBy = [ "default.target" ];
    };
  #   //10.180.136.30/nas /home/lakatos/mnt/nas_ba cifs noauto,user,_netdev,credentials=/home/lakatos/.config/cifs-utils/.cifs-credentials-nas-ba,uid=1000,gid=1000 0 0
    mount-nas-ba = {
      Unit.Description = "Mount S&B network storage - NAS BA";
      Service = {
        Type = "oneshot";
        RemainAfterExit = true;
        ExecStartPre = "/usr/bin/mkdir -p %h/mnt/nas_ba";
        ExecStart = "/usr/bin/mount %h/mnt/nas_ba";
        ExecStop = "/usr/bin/umount %h/mnt/nas_ba";
        Restart = "on-failure";
        RestartSec = 30;
      };
      Install.WantedBy = [ "default.target" ];
    };
  };
}