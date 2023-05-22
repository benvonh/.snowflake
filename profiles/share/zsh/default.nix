{ config, sharePath, ... }:
let
  name = "zsh";
  zshPath = sharePath name;
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
      export OPENER=bat
      export PAGER='bat --force-colorization --paging=always --style=full'
    '';
    initExtra = ''
      bindkey '\t' menu-select "$terminfo[kcbt]" menu-select
      bindkey -M menuselect '\t' menu-complete "$terminfo[kcbt]" reverse-menu-complete
    '';
    initExtraFirst = ''
      source ${zshPath}/setup.zsh
    '';
    shellAliases = {
      ga = "git add";
      gd = "git diff";
      gc = "git commit";
      gs = "git status";
      hms = "home-manager switch --flake ~/.flakes";
      nrs = "sudo nixos-rebuild switch --flake ~/.flakes";
      nsb = "nix-shell";
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
