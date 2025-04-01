{
  programs.gnome-terminal = {
    enable = true;
    themeVariant = "dark";
    profile."b1dcc9dd-5262-4d8d-a863-c897e6d979b9" = {
      colors.palette = "Tango";
      transparencyPercent = 20;
      audibleBell = false;
    };
  };
}