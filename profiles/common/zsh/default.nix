{ ... }:
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
      rclone-copy = "rclone copy --verbose drive: ~/drive && rclone copy --verbose ~/drive drive:";
      rclone-sync = "rclone sync --verbose drive: ~/drive && rclone sync --verbose ~/drive drive:";
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
  
  xdg.configFile = {
    zsh-init = {
      enable = true;
      target = "zsh/init.zsh";
      source = ./zsh/init.zsh;
    };
    zsh-p10k = {
      enable = true;
      target = "zsh/.p10k.zsh";
      source = ./zsh/.p10k.zsh;
    };
    zsh-powerlevel10k = {
      enable = true;
      target = "zsh/powerlevel10k";
      source = ./zsh/powerlevel10k;
      recursive = true;
    };
    zsh-autocomplete = {
      enable = true;
      target = "zsh/zsh-autocomplete";
      source = ./zsh/zsh-autocomplete;
      recursive = true;
    };
  };
}
