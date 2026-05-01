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
    initContent = ''
      # Load bash aliases if present
      if [ -f ~/.bash_aliases ]; then
        . ~/.bash_aliases
      fi

      # Homebrew environment
      eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    '';
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    historySubstringSearch.enable = true;
  };
}