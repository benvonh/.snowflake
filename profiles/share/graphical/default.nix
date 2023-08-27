{ inputs, outputs, lib, config, pkgs, ... }:
{
  home.packages = with pkgs; [
    vlc
    brave
    discord
    mission-center
    gnome.nautilus
    gnome.gnome-calculator
    gnome.gnome-disk-utility
    gnome.gnome-system-monitor
  ];

  programs.kitty = {
    enable = true;
    theme = "Gruvbox Dark";
    settings = {
      cursor_shape = "block";
      shell_integration = "no-cursor";
      placement_strategy = "center";
    };
    font = {
      name = "FiraCode Nerd Font";
      size = 11;
    };
    shellIntegration = {
      enableBashIntegration = true;
      enableFishIntegration = true;
    };
  };

  # programs.vscode = {
  #   enable = true;
  #   enableUpdateCheck = false;
  #   enableExtensionUpdateCheck = false;
  #   extensions = with pkgs.vscode-extensions; [
  #     ms-vscode.cpptools
  #     ms-vscode.cmake-tools
  #     ms-vscode.makefile-tools
  #     ms-vscode-remote.remote-ssh
  #     ms-python.python
  #     ms-python.vscode-pylance
  #     ms-pyright.pyright
  #     vscodevim.vim
  #     vscode-icons-team.vscode-icons
  #     marp-team.marp-vscode
  #     mhutchie.git-graph
  #     sumneko.lua
  #     jdinhlife.gruvbox
  #     arcticicestudio.nord-visual-studio-code
  #   ];
  #   userSettings = {
  #     "editor.rulers" = [ 80 ];
  #     "editor.fontFamily" = "FiraCode Nerd Font";
  #     "editor.fontLigatures" = true;
  #     "editor.cursorBlinking" = "expand";
  #     "editor.minimap.enabled" = false;
  #     "editor.cursorSmoothCaretAnimation" = "on";
  #     "files.autoSave" = "afterDelay";
  #     "terminal.integrated.fontFamily" = "FiraCode Nerd Font";
  #     "terminal.integrated.cursorBlinking" = true;
  #     "workbench.iconTheme" = "vscode-icons";
  #     "workbench.colorTheme" = "Gruvbox Dark Medium";
  #     "workbench.startupEditor" = "none";
  #     "window.menuBarVisibility" = "toggle";
  #   };
  # };
}
