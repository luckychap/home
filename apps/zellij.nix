{
  programs.zellij = {
    enable = true;
    settings = {
      copy_command = "wl-copy";
      show_startup_tips = false;
      keybinds = {
        shared_except = {
          _args = [
            "scroll"
            "locked"
          ];
          bind = {
            _args = ["Ctrl f"];
            _children = [
              { SwitchToMode = "Scroll";}
            ];
          };
          unbind = {
            _args = ["Ctrl s"];
          };
        };
      };
    };
  };
}