{ pkgs ? (import ../nixpkgs.nix) { } }:
{
  mpvpaper = pkgs.callPackage ./mpvpaper.nix { };
  vimix-cursors = pkgs.callPackage ./vimix-cursors.nix { };
  kanagawa-gtk-theme = pkgs.callPackage ./kanagawa-gtk-theme.nix { };
}
