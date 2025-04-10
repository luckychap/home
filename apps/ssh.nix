{
  programs.ssh = {
    enable = true;
    serverAliveInterval = 60;
    matchBlocks = {
      "kadmin" = {
        user = "mlakatos";
        hostname = "10.180.136.183";
        identityFile = "~/.ssh/id_ed25519_kadmin";
      };
      "monitoring" = {
        user = "toor";
        hostname = "10.180.136.55";
        identityFile = "~/.ssh/id_ed25519_monitoring";
      };
      "devops" = {
        user = "toor";
        hostname = "10.180.136.50";
        identityFile = "~/.ssh/id_ed25519_runner";
      };
      "ezmomi" = {
        user = "root";
        hostname = "172.31.32.46";
        identityFile = "~/.ssh/id_rsa_general";
      };
      "ctl-master" = {
        user = "toor";
        hostname = "10.180.133.56";
        identityFile = "~/.ssh/id_ed25519_ctl";
      };
      "hifi" = {
        user = "lucky";
        hostname = "192.168.0.102";
        PubkeyAuthentication = "no";
      };
    };
  };
}
