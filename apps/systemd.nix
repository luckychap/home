{
    systemd.user = {
        enable = true;
        mounts = {
            home-lakatos-nas = {
                Unit = {
                    Description = "Mount S&B network storage - NAS 01";
                };
                Mount = {
                    What = "//fza-nas-01.sb-sk.local/FCS-BTS";
                    Where = "/home/lakatos/nas/";
                    Type = "cifs";
                    Options = "credentials=/etc/cifs-utils/.cifs-credentials-lakatos,rw,uid=1000,gid=1000";
                    TimeoutSec = 30;
                };
            };
        };
    };
}