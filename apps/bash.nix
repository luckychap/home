{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    historySize = 10000;
    historyFileSize = 100000;
    historyControl = "ignoreboth";
    sessionVariables = "";
    initExtra = "";
    bashrcExtra = "";
    profileExtra = "";
    shellAliases = {
      awsLT = "aws eks update-kubeconfig --name ire-loadtests-dev-eks --alias aws-eks-loadtest";
      awsCLT = "aws eks update-kubeconfig --name ire-cltests-dev-eks --alias aws-eks-comploadtests --profile comploadtests";
      awsDVV = "aws eks update-kubeconfig --name fcs-sk-dvv-dev-eks --alias aws-eks-dvv --profile dvv";
      home-upgrade = "nix-channel --update && home-manager switch";
      ll = "ls -alF";
      la = "ls -A";
      l = "ls -CF";
      alert = "notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"";
      
    };
  };
}