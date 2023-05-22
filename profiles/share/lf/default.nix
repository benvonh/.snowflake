{ config, pkgs, sharePath, ... }:
let
  name = "lf";
  lfPath = sharePath name;
in
{
  programs.lf = {
    enable = true;
    settings = {
      icons = true;
      drawbox = true;
      scrolloff = 10;
    };
    commands = {
      create = ''
        %{{
          path=$(dirname "$fx")
          printf "New name: $path/"
          read ans
          if [[ "$ans" =~ /$ ]]; then
            mkdir "$path/$ans"
            printf "Created new directory $path/$ans"
          else
            touch "$path/$ans"
            printf "Created new file $path/$ans"
          fi
        }}
      '';
      trash = ''
        %{{
          printf "Delete file? [y/N] "
          read ans
          if [[ "$ans" == "y" ]]; then
            trash-put $fx
            printf "$fx sent to trash"
          else
            printf "Cancelled"
          fi
        }}
      '';
      cd-trash = "cd ~/.local/share/Trash/";
    };
    keybindings = {
      a = "create";
      D = "trash";
      T = "cd-trash";
      "." = "set hidden!";
    };
    previewer = {
      source = pkgs.writeShellScript "pv.sh" ''
        #!/usr/bin/env bash
        file=$1
        w=$(($2 - 1))
        h=$3
        x=$4
        y=$5
        
        case "$file" in
          *.zip )
            unzip -l "$file"
            ;;
          *.tar* )
            tar tf "$file"
            ;;
          *.jpg | *.jpeg | *.png | *.gif )
            exiftool "$file"
            ;;
          * )
            bat --force-colorization --paging=never --style=full "$file"
            ;;
        esac
      '';
    };
  };

  xdg.configFile.${name} = {
    source = ./icons;
    target = "${name}/icons";
  };
}
