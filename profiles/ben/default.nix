{ inputs, outputs, lib, config, pkgs, flakePath, ... }@args:
let
  user = "ben";
  homePath = "/home/${user}";
  commonPath = nix: flakePath homePath nix;
in
{
  imports = [
    (import ../common          (args // { inherit commonPath; }))
    (import ../common/apps     (args // { inherit commonPath; }))
    (import ../common/assets   (args // { inherit commonPath; }))
    (import ../common/avizo    (args // { inherit commonPath; }))
    (import ../common/git      (args // { inherit commonPath; }))
    (import ../common/gtk      (args // { inherit commonPath; }))
    (import ../common/helix    (args // { inherit commonPath; }))
    (import ../common/hypr     (args // { inherit commonPath; }))
    (import ../common/kitty    (args // { inherit commonPath; }))
    (import ../common/lf       (args // { inherit commonPath; }))
    (import ../common/mako     (args // { inherit commonPath; }))
    (import ../common/nvim     (args // { inherit commonPath; }))
    (import ../common/rice     (args // { inherit commonPath; }))
    (import ../common/swaylock (args // { inherit commonPath; }))
    (import ../common/terminal (args // { inherit commonPath; }))
    (import ../common/waybar   (args // { inherit commonPath; }))
    (import ../common/wofi     (args // { inherit commonPath; }))
    (import ../common/zsh      (args // { inherit commonPath; }))
  ];

  home = {
    username = user;
    homeDirectory = homePath;
    stateVersion = "22.11";
  };
}
