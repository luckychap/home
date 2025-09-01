{
    systemd.user = {
        enable = true;
        mounts = {
            "home-${builtins.getEnv "USER"}-mnt-nas_01" = {
                Unit = {
                    Description = "Mount S&B network storage - NAS 01";
                    After = "network-online.target";
                    Wants = "network-online.target";
                };
                Mount = {
                    What = "//fza-nas-01.sb-sk.local/FCS-BTS";
                    Where = "/home/${builtins.getEnv "USER"}/mnt/nas_01";
                    Type = "cifs";
                    Options = "credentials=/home/${builtins.getEnv "USER"}/.config/cifs-utils/.cifs-credentials-lakatos,rw,uid=1000,gid=1000";
#                    Options = "credentials=/home/${builtins.getEnv "USER"}/.config/cifs-utils/.cifs-credentials-lakatos,rw";
                    TimeoutSec = 30;
                };
            };
        };
    };
}