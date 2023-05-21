{ config, commonPath, ... }:
let
  name = "hypr";
  hyprPath = commonPath name;
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
