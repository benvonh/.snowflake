{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    enableUpdateCheck = false;
    enableExtensionUpdateCheck = false;
    extensions = with pkgs.vscode-extensions; [
      marp-team.marp-vscode
      mhutchie.git-graph
      ms-vscode.cpptools
      ms-vscode.cmake-tools
      ms-vscode.makefile-tools
      ms-vscode.theme-tomorrowkit
      ms-vscode-remote.remote-ssh
      ms-pyright.pyright
      ms-python.python
      ms-python.vscode-pylance
      sumneko.lua
      vscodevim.vim
      vscode-icons-team.vscode-icons
    ];
    userSettings = {
      "editor.rulers" = [ 80 ];
      "editor.fontFamily" = "FiraCode Nerd Font";
      "editor.fontLigatures" = true;
      "editor.cursorBlinking" = "expand";
      "editor.minimap.enabled" = false;
      "editor.cursorSmoothCaretAnimation" = "on";
      "files.autoSave" = "afterDelay";
      "terminal.integrated.fontFamily" = "FiraCode Nerd Font";
      "terminal.integrated.cursorBlinking" = true;
      "workbench.iconTheme" = "vscode-icons";
      "workbench.colorTheme" = "Kanagawa";
      "workbench.startupEditor" = "none";
      "window.menuBarVisibility" = "toggle";
    };
  };
}
