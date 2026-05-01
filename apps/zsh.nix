{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";

      plugins = [
        "git"
      ];
    };
    shellAliases = {
      awsLT = "aws eks update-kubeconfig --name ire-loadtests-dev-eks --alias aws-eks-loadtest";
      awsCLT = "aws eks update-kubeconfig --name ire-cltests-dev-eks --alias aws-eks-comploadtests --profile comploadtests";
      awsDVV = "aws eks update-kubeconfig --name fcs-sk-dvv-dev-eks --alias aws-eks-dvv --profile dvv";
      home-upgrade = "nix-channel --update && home-manager switch";
      ll = "ls -alF";
      la = "ls -A";
      l = "ls -CF";
      alert = "notify-send --urgency=low -i \"$([ $? = 0 ] && echo terminal || echo error)\" \"$(history | tail -n1 | sed -e 's/^\\s*[0-9]\\+\\s*//;s/[;&|]\\s*alert$//')\"";
    };
    initContent = ''
      # Homebrew environment
      eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
      if [ -e /home/lucky/.nix-profile/etc/profile.d/nix.sh ]; then . /home/lucky/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
    '';
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    historySubstringSearch.enable = true;
  };
}