{ lib
, stdenv
, fetchFromGitHub
}:

stdenv.mkDerivation rec {
  pname = "kanagawa-gtk-theme";
  version = "";

  src = fetchFromGitHub {
    owner = "Fausto-Korpsvart";
    repo = "Kanagawa-GKT-Theme";
    rev = "7b8ece4382533491e82f9b3d5552607f67a79999";
    sha256 = "sha256-Jtu04SKXk0wFRvx2Duz0YxHEWJ2sM8ZIT+dtdJqKykY=";
  };

  dontPatchELF = true;
  dontRewriteSymlinks = true;
  dontDropIconThemeCache = true;

  installPhase = ''
    mkdir -p $out/share/icons/
    mkdir -p $out/share/themes/
    cp -r icons/Kanagawa $out/share/icons/
    cp -r themes/Kanagawa-BL $out/share/themes/
    rm -r *
  '';

  meta = with lib; {
    description = "A GTK theme with the Kanagawa colour palette";
    homepage = src.meta.homepage;
    license = licenses.gpl3Only;
    platforms = platforms.all;
  };
}
