{
  programs.vim = {
    enable = true;
    extraConfig = ''
      cmap w!! w !sudo tee > /dev/null % 
    '';
  };
}
