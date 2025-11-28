{ config, pkgs, ... }:

{
  # Home Manager needs to enable using unfree packages
  nixpkgs = {
    config= {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  home.username = "${config.home.sessionVariables.USER}";
  home.homeDirectory = "/home/${config.home.sessionVariables.USER}";

  home.stateVersion = "24.11"; # Please read the comment before changing.

  home.packages = with pkgs; [
    # Containers
    docker
    docker-compose
    kind

    # K8s
    kubectl
    krew
    (wrapHelm kubernetes-helm { plugins = [ pkgs.kubernetes-helmPlugins.helm-diff ]; })

    # Data
    jq
    yq-go

    # Shell tools
    gum
    curl
    xclip
    awscli2

    # Security
    vault
    keystore-explorer

    # Development tools
    devbox

    # Network
    nmap
    remmina

    # Java
    zulu17

    # System
    htop
    gnomeExtensions.clipboard-indicator
    smile
    solaar

    # Others
    standardnotes

  ];

  imports = [
    ./apps/zellij.nix
    ./apps/ssh.nix
    ./apps/vim.nix
    ./apps/gnome-terminal.nix
    ./apps/k9s.nix
#    ./apps/bash.nix
#    ./apps/systemd.nix
    ./services/ssh-agent.nix
    ./vars/session-vars.nix
  ];

  dconf = {
    enable = true;
    settings = {
      "org/gnome/shell" = {
        # `gnome-extensions list` for a list
        enabled-extensions = [
          "clipboard-indicator@tudmotu.com"
        ];
      };
      "org/gnome/settings-daemon/plugins/media-keys" = {
        custom-keybindings = [
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
        ];
      };
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
        # dconf dump /org/gnome/settings-daemon/plugins/
        binding = "<Shift><Super>e";
        command = "sh -c '/home/${config.home.sessionVariables.USER}/.nix-profile/bin/smile'";
        name = "emoji";
      };
    };
  };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/lakatos/etc/profile.d/hm-session-vars.sh
  #
  # home.sessionVariables = {
  #   USER = builtins.getEnv "USER";
  # };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
