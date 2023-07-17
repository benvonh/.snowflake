{ config, pkgs, sharePath, ... }:
let
  name = "nvim";
  nvimPath = sharePath name;
in
{
  home.packages = with pkgs; [
    neovim
    clang-tools
    cmake-language-server
    pyright
    rnix-lsp
    sumneko-lua-language-server
    nodePackages.bash-language-server
    nodePackages.vscode-langservers-extracted
  ];

  xdg.configFile.${name} = with config.lib.file; {
    source = mkOutOfStoreSymlink nvimPath;
    target = name;
  };
}
