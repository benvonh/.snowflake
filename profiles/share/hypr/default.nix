{ config, sharePath, ... }:
let
  name = "hypr";
  hyprPath = sharePath name;
in
{
  programs.zsh.profileExtra = ''
    [[ $(tty) == /dev/tty1 ]] && exec Hyprland
  '';

  xdg.configFile.${name} = with config.lib.file; {
    source = mkOutOfStoreSymlink hyprPath;
    target = name;
  };
}
