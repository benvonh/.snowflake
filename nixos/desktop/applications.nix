{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    brave
    kitty
    pcmanfm
    virt-manager
    vscode
  ];
}
