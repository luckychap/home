{
  programs.ssh = {
    enableDefaultConfig = false;
    enable = true;
    matchBlocks = {
      "git.ads.local" = {
        hostname = "git.ads.local";
        identityFile = "~/.ssh/id_ed25519_gitlab";
        serverAliveInterval = 60;
      };
      "sb-ai" = {
        user = "locallm";
        hostname = "10.180.136.87";
        identityFile = "~/.ssh/id_ed25519_sb_ai";
        serverAliveInterval = 60;
      };
      "kadmin" = {
        user = "mlakatos";
        hostname = "10.180.136.183";
        identityFile = "~/.ssh/id_ed25519_kadmin";
        serverAliveInterval = 60;
      };
      "monitoring" = {
        user = "toor";
        hostname = "10.180.136.55";
        identityFile = "~/.ssh/id_ed25519_monitoring";
        serverAliveInterval = 60;
      };
      "devops" = {
        user = "toor";
        hostname = "10.180.136.50";
        identityFile = "~/.ssh/id_ed25519_runner";
        serverAliveInterval = 60;
      };
      "ezmomi" = {
        user = "root";
        hostname = "172.31.32.46";
        identityFile = "~/.ssh/id_rsa_general";
        serverAliveInterval = 60;
      };
      "bakx-node0" = {
        user = "root";
        hostname = "10.180.137.201";
        identityFile = "~/.ssh/id_rsa_general";
        serverAliveInterval = 60;
      };
      "ctl-master" = {
        user = "toor";
        hostname = "10.180.136.20";
        identityFile = "~/.ssh/id_ed25519_ctl";
        serverAliveInterval = 60;
      };
      "hifi" = {
        user = "lucky";
        hostname = "192.168.0.102";
        identitiesOnly = true;
        serverAliveInterval = 60;
      };
      "homeai" = {
        user = "toor";
        hostname = "192.168.0.110";
        identityFile = "~/.ssh/id_ed25519_homeai";
        serverAliveInterval = 60;
      };
      "docker" = {
        user = "root";
        hostname = "192.168.0.234";
        identityFile = "~/.ssh/id_ed25519_docker";
        serverAliveInterval = 60;
      };
      "mercury" = {
        user = "lucky";
        hostname = "192.168.0.105";
        identityFile = "~/.ssh/id_ed25519_mercury";
        serverAliveInterval = 60;
      };
    };
  };
}
