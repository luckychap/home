{
  programs.ssh = {
    enable = true;
    serverAliveInterval = 60;
    matchBlocks = {
      "git.ads.local" = {
        hostname = "git.ads.local";
        identityFile = "~/.ssh/id_ed25519_gitlab";
      };
      "sb-ai" = {
        user = "locallm";
        hostname = "10.180.136.87";
        identityFile = "~/.ssh/id_ed25519_sb_ai";
      };
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
      "bakx-node0" = {
        user = "root";
        hostname = "10.180.137.201";
        identityFile = "~/.ssh/id_rsa_general";
      };
      "ctl-master" = {
        user = "toor";
        hostname = "10.180.136.20";
        identityFile = "~/.ssh/id_ed25519_ctl";
      };
      "hifi" = {
        user = "lucky";
        hostname = "192.168.0.102";
        identitiesOnly = true;
      };
      "homeai" = {
        user = "toor";
        hostname = "192.168.0.177";
        identityFile = "~/.ssh/id_ed25519_homeai";
      };
      "docker" = {
        user = "root";
        hostname = "192.168.0.234";
        identityFile = "~/.ssh/id_ed25519_docker";
      };
      "mercury" = {
        user = "lucky";
        hostname = "192.168.0.104";
        identityFile = "~/.ssh/id_ed25519_mercury";
      };
    };
  };
}
