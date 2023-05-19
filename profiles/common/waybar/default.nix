{ ... }:
{
  #xdg.configFile.config.jsonc = {
  #  enable = true;
  #  target = "waybar/config.jsonc";
  #  source = ./config.jsonc;
  #};

  #xdg.configFile.waybar = {
  #  enable = true;
  #  target = "waybar/style.css";
  #  source = ./stycle.css;
  #};

  #xdg.configFile.waybar = {
  #  enable = true;
  #  target = "waybar/nord.css";
  #  source = ./nord.css;
  #};

  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        mod = "dock";
        exclusive = true;
        passthrough = false;
        gtk-layer-shell = true;
        height = 0;

        modules-left = [
          "cpu"
          "memory"
          "disk"
          "network"
        ];
        modules-center = [
          "wlr/workspaces"
        ];
        modules-right = [
          "tray"
          "battery"
          "pulseaudio"
          "pulseaudio#microphone"
          "clock"
        ];

        cpu = {
            format = " {avg_frequency}Ghz";
            interval = 5;
        };
        memory = {
            format = " {used =0.1f}G";
            interval = 5;
        };
        disk = {
            format = " {used}";
            interval = 60;
        };
        network = {
            format = "{ifname}";
            format-wifi = " {bandwidthDownBytes}";
            format-ethernet = " {bandwidthDownBytes} ({ipaddr}/{cidr})";
            format-disconnected = " Disconnected";
            interface = "wlp5s0";
            interval = 5;
        };

        "wlr/workspaces" = {
            all-outputs = true;
            format = "{icon}";
            format-icons = {
                "1" = "";
                "2" = "";
                "3" = "";
                "4" = "";
                "5" = "";
                urgent = "";
                active = "";
                default = "";
            };
            on-click = "activate";
            on-scroll-down = "hyprctl dispatch workspace e-1";
            on-scroll-up = "hyprctl dispatch workspace e+1";
        };
        "hyprland/window" = {
            format = "{}";
            max-length = 64;
            tooltip = false;
        };

        tray = {
            icon-size = 16;
            spacing = 8;
            tooltip = true;
        };
        battery = {
            format = "{icon}  {capacity}%";
            format-icons = [""  ""  ""  ""  ""];
            states = {
                warning = 30;
                critical = 15;
            };
        };
        pulseaudio = {
            format = "{icon} {volume}%";
            format-icons = {
                headphone = "";
                hands-free = "";
                headset = "";
                phone = "";
                portable = "";
                car = "";
                default = [""  ""  ""];
            };
            format-muted = " Muted";
            on-click = "volumectl toggle-mute";
            on-scroll-down = "volumectl -u up 1";
            on-scroll-up = "volumectl -u down 1";
            scroll-step = 1;
        };
        "pulseaudio#microphone" = {
            format = "{format_source}";
            format-source = " {volume}%";
            format-source-muted = " Muted";
            on-click = "volumectl -m toggle-mute";
            on-scroll-down = "voluemctl -m -u up 1";
            on-scroll-up = "volumectl -m -u down 1";
            scroll-step = 1;
        };
        clock = {
            format = "{ = %R   %d/%m}";
            tooltip-format = "<tt><small>{calendar}</small></tt>";
        };
      };
    };
    style = ''
      /* polar night */
      @define-color dark0 #2E3440;
      @define-color dark1 #3B4252;
      @define-color dark2 #434C5E;
      @define-color dark3 #4C566A;

      /* snow storm */
      @define-color light0 #D8DEE9;
      @define-color light1 #E5E9F0;
      @define-color light2 #ECEFF4;

      /* frost */
      @define-color frost0 #8FBCBB;
      @define-color frost1 #88C0D0;
      @define-color frost2 #81A1C1;
      @define-color frost3 #5E81AC;

      /* aurora */
      @define-color red       #BF616A;
      @define-color orange    #D08770;
      @define-color yellow    #EBCB8B;
      @define-color green     #A3BE8C;
      @define-color magenta   #B48EAD;

      * {
          font-family: FiraCode Nerd Font;
          font-size: 14px;
          font-weight: bold;
      }

      window#waybar {
          background: @dark1;
      }

      tooltip {
          background: @dark1;
          border-color: @frost0;
          border-style: solid;
          border-width: 2px;
      }

      tooltip label {
          color: @frost0;
      }

      #cpu,
      #memory,
      #disk,
      #network,
      #workspaces,
      #window,
      #tray,
      #battery,
      #pulseaudio,
      #clock {
          background: @dark1;
          color: @frost0;
          padding: 4px 16px;
      }

      #network.disabled,
      #network.disconnected {
          color: @red;
      }

      #workspaces button {
          color: @dark3;
      }
      #workspaces button.active {
          color: @frost0;
      }
      #workspaces button.urgent {
          color: @yellow;
      }
      #workspaces button:hover {
          color: @frost3;
      }

      #battery.charging {
          color: @yellow;
      }
      #battery.critical {
          color: @frost0;
      }
      @keyframes blink {
          to {
              color: @red;
          }
      }
      #battery.warning:not(.charging) {
          color: @red;
          animation-name: blink;
          animation-duration: 0.5s;
          animation-timing-function: linear;
          animation-iteration-count: infinite;
          animation-direction: alternate;
      }

      #pulseaudio.muted {
          color: @red;
      }
      #pulseaudio.source-muted {
          color: @red;
      }
    '';
  };
}
