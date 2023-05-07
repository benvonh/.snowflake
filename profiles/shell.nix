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
    shellAliases = {
      snow-home = "home-manager switch --flake ~/snow";
      snow-nixos = "sudo nixos-rebuild switch --flake ~/snow";
      snow-update = "nix flake update ~/snow";
      nix-shell-zsh = "nix-shell --run zsh";
    };
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
