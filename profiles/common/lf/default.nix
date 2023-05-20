{ pkgs, ... }:
{
  programs.lf = {
    enable = true;
    settings = {
      icons = true;
      hidden = true;
      number = false;
      drawbox = true;
    };
    commands = {
      mkdir = ''
        ''${{
          printf "Directory name: "
          read ans
          mkdir $ans
        }}
      '';
    };
    cmdKeybindings = {

    };
    keybindings = {
      mk = "mkdir";
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
            bat --force-colorization --paging=never --style=changes,numbers "$file"
            ;;
        esac
      '';
    };
  };

  xdg.configFile.lf-icons = {
    enable = true;
    source = ./icons;
    target = "lf/icons";
  };
}
