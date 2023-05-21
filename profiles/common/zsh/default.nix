{ config, commonPath, ... }:
let
  name = "zsh";
  zshPath = commonPath name;
in
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
      export PAGER=bat
      export OPENER=bat
    '';
    initExtraFirst = ''
      source ${zshPath}/init.zsh
    '';
    shellAliases = {
      ga = "git add";
      gs = "git status";
      gc = "git commit";
      hms = "home-manager switch --flake ~/.flakes";
      nrs = "sudo nixos-rebuild switch --flake ~/.flakes";
      ns = "nix-shell";
      nsz = "nix-shell --run zsh";
      rclone-copy = "rclone copy --verbose drive: ~/drive && rclone copy --verbose ~/drive drive:";
      rclone-sync = "rclone sync --verbose drive: ~/drive && rclone sync --verbose ~/drive drive:";
    };
    zplug = {
      enable = true;
      plugins = [
        { 
          name = "romkatv/powerlevel10k";
          tags = [ as:theme depth:1 ];
        }
        {
          name = "marlonrichert/zsh-autocomplete";
          tags = [ as:plugin depth:1 ];
        }
      ];
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

  xdg.configFile.${name} = with config.lib.file; {
    source = mkOutOfStoreSymlink zshPath;
    target = name;
  };
}
