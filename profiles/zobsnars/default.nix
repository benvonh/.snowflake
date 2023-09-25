{ inputs, outputs, lib, config, pkgs, ... }@args:
let
  user = "zobsnars";
  userPath = "/home/${user}";
  sharePath = nix: "${userPath}/.snowflake/profiles/share/${nix}";
in
{
  imports = [
    (import ../share/common    (args // { share = sharePath; }))
    (import ../share/terminal  (args // { share = sharePath; }))
    (import ../share/graphical (args // { share = sharePath; }))
  ];

  home.username = user;
  home.homeDirectory = userPath;
}
