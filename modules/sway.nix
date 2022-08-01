{ config, ... }: {
  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true;

    swaynag.enable = true;

    config = {
      bars = [{ "command" = "waybar"; }];
      modifier = "Mod4";
      floating.modifier = "Mod4";
      terminal = "foot";
      menu = "bemenu-run";
      fonts = {
        names = [ "Hack" ];
        size = 9.8;
      };

      input = {
        "type:keyboard" = {
          "xkb_layout" = "us";
          "xkb_options" = "ro_de_symbols_qwerty:ro_de_letters";
        };
      };

      keybindings = let
        mod = config.wayland.windowManager.sway.config.modifier;
        inherit (config.wayland.windowManager.sway.config)
          left down up right menu terminal;
      in {
        "${mod}+Return" = "exec ${terminal}";
        "${mod}+Shift+q" = "kill";
        "${mod}+q" = "exec ${menu}";
        "${mod}+m" = "exec pavucontrol-qt";
        "Print" = "exec slurp | grim -g - - | wl-copy";

        "${mod}+${left}" = "focus left";
        "${mod}+${down}" = "focus down";
        "${mod}+${up}" = "focus up";
        "${mod}+${right}" = "focus right";

        "${mod}+Left" = "focus left";
        "${mod}+Down" = "focus down";
        "${mod}+Up" = "focus up";
        "${mod}+Right" = "focus right";

        "${mod}+Shift+${left}" = "move left";
        "${mod}+Shift+${down}" = "move down";
        "${mod}+Shift+${up}" = "move up";
        "${mod}+Shift+${right}" = "move right";

        "${mod}+Shift+Left" = "move left";
        "${mod}+Shift+Down" = "move down";
        "${mod}+Shift+Up" = "move up";
        "${mod}+Shift+Right" = "move right";

        "${mod}+Shift+space" = "floating toggle";
        "${mod}+space" = "focus mode_toggle";

        "${mod}+1" = "workspace number 1";
        "${mod}+2" = "workspace number 2";
        "${mod}+3" = "workspace number 3";
        "${mod}+4" = "workspace number 4";
        "${mod}+5" = "workspace number 5";
        "${mod}+6" = "workspace number 6";
        "${mod}+7" = "workspace number 7";
        "${mod}+8" = "workspace number 8";
        "${mod}+9" = "workspace number 9";
        "${mod}+0" = "workspace number 10";

        "${mod}+Shift+1" = "move container to workspace number 1";
        "${mod}+Shift+2" = "move container to workspace number 2";
        "${mod}+Shift+3" = "move container to workspace number 3";
        "${mod}+Shift+4" = "move container to workspace number 4";
        "${mod}+Shift+5" = "move container to workspace number 5";
        "${mod}+Shift+6" = "move container to workspace number 6";
        "${mod}+Shift+7" = "move container to workspace number 7";
        "${mod}+Shift+8" = "move container to workspace number 8";
        "${mod}+Shift+9" = "move container to workspace number 9";
        "${mod}+Shift+0" = "move container to workspace number 10";

        "${mod}+minus" = "scratchpad show";
        "${mod}+Shift+minus" = "move scratchpad";

        "${mod}+Shift+c" = "reload";
        "${mod}+b" = "split h";
        "${mod}+v" = "split v";
        "${mod}+f" = "fullscreen";

        "${mod}+s" = "layout stacking";
        "${mod}+w" = "layout tabbed";
        "${mod}+e" = "layout toggle split";
        "${mod}+a" = "focus parent";

        "${mod}+r" = "mode resize";
      };

      startup = [
        { command = "dbus-sway-environment"; }
        { command = "configure-gtk"; }
        { command = "mpdscribble"; }
      ];

      output = {
        "*".bg =
          "/home/bogdb/Pictures/Wallpapers/dark-stock_2560x1440.jpg fill";
        "DP-2" = {
          "pos" = "0 0";
          "res" = "2560x1440";
        };
        "HDMI-A-1" = {
          "pos" = "2560 0";
          "res" = "3840x2160";
        };
      };
    };

    extraSessionCommands = ''
      export GTK_USE_PORTAL="1";
      export MOZ_ENABLE_WAYLAND="1";
      export QT_QPA_PLATFORM="wayland";
      export QT_QPA_PLATFORMTHEME="qt5ct";
      export XKB_DEFAULT_OPTIONS="compose:menu";
    '';
  };

  services.swayidle.enable = true;
}
