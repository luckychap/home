{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    historySize = 10000;
    historyFileSize = 100000;
    historyControl = [ "ignoreboth" ];
    shellOptions = [
      "histappend"
      "checkwinsize"
      # "globstar" # uncomment if you want it
    ];
    initExtra = ''
      case $- in
      *i*) ;;
        *) return;;
      esac

      if [ -x /usr/bin/lesspipe ]; then
        eval "$(SHELL=/bin/sh lesspipe)"
      fi

      if [ -z "''${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
        debian_chroot=$(cat /etc/debian_chroot)
      fi

      case "$TERM" in
          xterm-color|*-256color) color_prompt=yes;;
      esac

      if [ -n "$force_color_prompt" ]; then
          if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
              color_prompt=yes
          else
              color_prompt=
          fi
      fi

      if [ "$color_prompt" = yes ]; then
          PS1="''${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "
      else
          PS1="''${debian_chroot:+($debian_chroot)}\u@\h:\w\$ "
      fi
      unset color_prompt force_color_prompt

      case "$TERM" in
      xterm*|rxvt*)
          PS1="\[\e]0;''${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
          ;;
      esac

      if [ -x /usr/bin/dircolors ]; then
        if [ -r ~/.dircolors ]; then
          eval "$(dircolors -b ~/.dircolors)"
        else
          eval "$(dircolors -b)"
        fi
      fi

      if [ -f ~/.bash_aliases ]; then
        . ~/.bash_aliases
      fi

      if ! shopt -oq posix; then
        if [ -f /usr/share/bash-completion/bash_completion ]; then
          . /usr/share/bash-completion/bash_completion
        elif [ -f /etc/bash_completion ]; then
          . /etc/bash_completion
        fi
      fi
      dconf write /org/gnome/Ptyxis/Profiles/$(dconf read /org/gnome/Ptyxis/default-profile-uuid | tr -d "\'")/opacity 0.80
    '';
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
      alert = "notify-send --urgency=low -i \"$([ $? = 0 ] && echo terminal || echo error)\" \"$(history | tail -n1 | sed -e 's/^\\s*[0-9]\\+\\s*//;s/[;&|]\\s*alert$//')\"";
    };
  };
}