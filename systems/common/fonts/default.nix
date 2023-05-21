{ inputs, outputs, lib, config, pkgs, ... }:
{
  fonts.fonts = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    meslo-lgs-nf
    (nerdfonts.override {
      fonts = [
        "FiraCode"
        "Hasklig"
        "JetBrainsMono"
      ];
    })
  ];
}
