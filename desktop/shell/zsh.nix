{ ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = false;
    defaultKeymap = "emacs";
    initExtraFirst = "source ~/.config/zsh/extra.zsh";
    history.share = false;
  };
  
  xdg.configFile.zsh = {
    source = ../../config/zsh;
    target = "zsh";
  };
}
