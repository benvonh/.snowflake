# Thanks to wegnak/nur-packages
{ lib
, stdenv
, fetchFromGitHub
, meson
, ninja
, cmake
, pkg-config
, libGL
, mpv
, wayland
, wayland-protocols
, wlroots
}:

stdenv.mkDerivation rec {
  pname = "mpvpaper";
  version = "1.3";

  src = fetchFromGitHub {
    owner = "GhostNaN";
    repo = pname;
    rev = version;
    hash = "sha256-0LjIwOY2hBUb0nziD3HLP2Ek5+8v3ntssRFD9eQgWkc=";
  };

  nativeBuildInputs = [
    meson
    ninja
    cmake
    pkg-config
  ];

  buildInputs = [
    libGL
    mpv
    wayland
    wayland-protocols
    wlroots
  ];

  meta = with lib; {
    homepage = "https://github.com/GhostNaN/mpvpaper";
    description = "A video wallpaper program for wlroots based wayland compositors";
    license = licenses.gpl3Plus;
    platforms = platforms.linux;
    broken = !stdenv.isLinux;
    maintainers = with maintainers; [ wegank ];
  };
}
