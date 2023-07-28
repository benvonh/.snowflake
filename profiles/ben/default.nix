{ inputs, outputs, lib, config, pkgs, ... }@args:
let
  user = "ben";
  userPath = "/home/${user}";
  sharePath = nix: "${userPath}/.snow/profiles/share/${nix}";
in
{
  imports = [
    (import ../share/theme     (args // { share = sharePath; }))
    (import ../share/assets    (args // { share = sharePath; }))
    (import ../share/common    (args // { share = sharePath; }))
    (import ../share/hyprland  (args // { share = sharePath; }))
    (import ../share/terminal  (args // { share = sharePath; }))
    (import ../share/graphical (args // { share = sharePath; }))
  ];

  home.username = user;
  home.homeDirectory = userPath;
}
