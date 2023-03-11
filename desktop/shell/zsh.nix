{ ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = false;
    defaultKeymap = "emacs";
    dotDir = ".config/zsh";
    initExtraFirst = "source ~/.config/zshtmp/extra.zsh";
    history.share = false;
  };
  
  xdg.configFile.zsh = {
    source = ../../config/zsh;
    target = "zshtmp";
  };
}