{ inputs, outputs, lib, config, pkgs, flakePath, ... }@args:
let
  user = "ben";
  homePath = "/home/${user}";
  sharePath = nix: flakePath homePath nix;
in
{
  imports = [
    (import ../share/common   (args // { inherit sharePath; }))
    (import ../share/git      (args // { inherit sharePath; }))
    (import ../share/nvim     (args // { inherit sharePath; }))
    (import ../share/ranger   (args // { inherit sharePath; }))
    (import ../share/rice     (args // { inherit sharePath; }))
    (import ../share/terminal (args // { inherit sharePath; }))
    (import ../share/zsh      (args // { inherit sharePath; }))
  ];

  home = {
    username = user;
    homeDirectory = homePath;
    stateVersion = "22.11";
  };
}
