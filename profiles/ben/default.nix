{ inputs, outputs, lib, config, pkgs, flakePath, ... }@args:
let
  user = "ben";
  homePath = "/home/${user}";
  sharePath = nix: flakePath homePath nix;
in
{
  imports = [
    (import ../share/apps     (args // { inherit sharePath; }))
    (import ../share/assets   (args // { inherit sharePath; }))
    (import ../share/avizo    (args // { inherit sharePath; }))
    (import ../share/common   (args // { inherit sharePath; }))
    (import ../share/git      (args // { inherit sharePath; }))
    (import ../share/gtk      (args // { inherit sharePath; }))
    (import ../share/helix    (args // { inherit sharePath; }))
    (import ../share/hypr     (args // { inherit sharePath; }))
    (import ../share/kitty    (args // { inherit sharePath; }))
    (import ../share/mako     (args // { inherit sharePath; }))
    (import ../share/nvim     (args // { inherit sharePath; }))
    (import ../share/ranger   (args // { inherit sharePath; }))
    (import ../share/rice     (args // { inherit sharePath; }))
    (import ../share/swayidle (args // { inherit sharePath; }))
    (import ../share/swaylock (args // { inherit sharePath; }))
    (import ../share/terminal (args // { inherit sharePath; }))
    (import ../share/waybar   (args // { inherit sharePath; }))
    (import ../share/wofi     (args // { inherit sharePath; }))
    (import ../share/zsh      (args // { inherit sharePath; }))
  ];

  home = {
    username = user;
    homeDirectory = homePath;
    stateVersion = "22.11";
  };
}
