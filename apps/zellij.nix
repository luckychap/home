{
  programs.zellij = {
    enable = true;
    settings = {
      copy_command = "xclip -selection clipboard";
      show_startup_tips = false;
    };
  };
}