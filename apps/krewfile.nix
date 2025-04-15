# https://github.com/brumhard/krewfile

inputs.krewfile = {
  url = "github:brumhard/krewfile";
  inputs.nixpkgs.follows = "nixpkgs";
};


{ inputs, pkgs, ... }: {
  imports = [
    inputs.krewfile.homeManagerModules.krewfile
  ];

  programs.krewfile = {
    enable = true;
    krewPackage = pkgs.krew;
    plugins = [
      "get-all"
    ];
  };
}