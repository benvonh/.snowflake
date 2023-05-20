{ inputs, outputs, lib, config, pkgs, ... }:
{
  imports = [
    ../common
    ../common/fish
    ../common/git
    ../common/helix
    ../common/lf
    ../common/neovim
    ../common/rice
    ../common/terminal
  ];

  home = {
    username = "ben";
    homeDirectory = "/home/ben";
    stateVersion = "22.11";
  };
}
