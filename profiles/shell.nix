{ self, config, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = false;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    defaultKeymap = "emacs";
    envExtra = ''
      export TERM=kitty
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