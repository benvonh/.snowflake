{ pkgs, ... }:
{
  home.packages = with pkgs; [
    neofetch tty-clock pipes-rs cava
  ];
}
