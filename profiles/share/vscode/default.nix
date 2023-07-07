{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
        ms-vscode.cpptools
        ms-vscode.makefile-tools
        ms-vscode.cmake-tools
        ms-python.vscode-pylance
        sumneko.lua
    ];
  };
}
