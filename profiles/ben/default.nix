{ inputs, outputs, lib, config, pkgs, ... }@args:
let
  share = nix: "${./.}/profiles/share/${nix}";
in
{
  imports = [
    (import ../share/assets    (args // { inherit share; }))
    (import ../share/common    (args // { inherit share; }))
    (import ../share/graphical (args // { inherit share; }))
    (import ../share/hyprland  (args // { inherit share; }))
    (import ../share/terminal  (args // { inherit share; }))
    (import ../share/theme     (args // { inherit share; }))
  ];

  home.username = "ben";
  home.homeDirectory = "/home/ben";
}
