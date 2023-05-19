{ ... }:
{
  #programs.wofi = {
  #  enable = true;
  #  settings = {
  #    key_up = "Control_L-p";
  #    key_down = "Control_L_n";
  #  };
  #  style = ''
  #    /* polar night */
  #    @define-color dark0 #2E3440;
  #    @define-color dark1 #3B4252;
  #    @define-color dark2 #434C5E;
  #    @define-color dark3 #4C566A;

  #    /* snow storm */
  #    @define-color light0 #D8DEE9;
  #    @define-color light1 #E5E9F0;
  #    @define-color light2 #ECEFF4;

  #    /* frost */
  #    @define-color frost0 #8FBCBB;
  #    @define-color frost1 #88C0D0;
  #    @define-color frost2 #81A1C1;
  #    @define-color frost3 #5E81AC;

  #    /* aurora */
  #    @define-color red       #BF616A;
  #    @define-color orange    #D08770;
  #    @define-color yellow    #EBCB8B;
  #    @define-color green     #A3BE8C;
  #    @define-color magenta   #B48EAD;

  #    #window {
  #        background-color: @dark0;
  #        font-family: FiraCode Nerd Font;
  #        font-size: 14px;
  #    }

  #    #input {
  #        background-color: @dark3;
  #        color: @light2;
  #        margin: 8px;
  #    }

  #    #inner-box {
  #        background-color: @dark0;
  #        margin: 8px;
  #    }

  #    #outer-box {
  #        background-color: @dark0;
  #        margin: 8px;
  #    }

  #    #text {
  #        color: @light2;
  #        margin: 8px;
  #    } 

  #    #entry:selected {
  #        background-color: @dark3;
  #        margin: 2px;
  #    }

  #    #entry:selected * {
  #        background-color: @dark3;
  #        margin: 2px;
  #    }
  #  '';
  #};

  xdg.configFile = {
    wofi = {
      enable = true;
      recursive = true;
      source = ./wofi;
      target = "wofi";
    };
  };
}
