{ config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = false;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    # autocd = true; # Since zsh-autocomplete is not used
    defaultKeymap = "emacs";
    profileExtra = ''
      [[ $(tty) == /dev/tty1 ]] && exec ~/.config/hypr/launch.bash
    ''; # profileExtra
    envExtra = ''
      export EDITOR=hx
    '';
    initExtraFirst = ''
      source ~/.config/zsh/init.zsh
    '';
    history = {
      expireDuplicatesFirst = true;
      ignoreDups = true;
      share = false;
    };
    historySubstringSearch = {
      enable = true;
    };
  };
  
  xdg.configFile = with config.lib.file; {
    zsh = {
      source = mkOutOfStoreSymlink "${config.home.homeDirectory}/snow/config/zsh";
      target = "zsh";
    };
  };
}
