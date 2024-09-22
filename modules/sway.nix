{ config, pkgs, ... }:
let
  nixConfigDir = "${config.home.homeDirectory}/.config/home-manager";
in
{
  xdg.enable = true;
  xdg.portal = {
    enable = true;
    config = {
      sway = {
        "org.freedesktop.impl.portal.Secret" = [ "gnome-keyring" ];
        default = [ "wlr" "gtk" ];
      };
      common = { default = [ "gtk" ]; };
    };
    extraPortals = with pkgs; [ xdg-desktop-portal-wlr xdg-desktop-portal-gtk ];
    xdgOpenUsePortal = true;
  };

  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    swaynag.enable = true;
    checkConfig = false;

    package = pkgs.sway;

    config = {
      bars = [{ "command" = "waybar"; }];
      modifier = "Mod4";
      floating.modifier = "Mod4";
      terminal = "alacritty";
      menu = "bemenu-run";
      fonts = {
        names = [ "Consolas" ];
        size = 11.0;
      };

      input = {
        "type:keyboard" = {
          "xkb_layout" = "us";
        };
      };

      keybindings =
        let
          mod = config.wayland.windowManager.sway.config.modifier;
          inherit (config.wayland.windowManager.sway.config)
            left down up right menu terminal;
        in
        {
          "${mod}+Return" = "exec ${terminal}";
          "${mod}+Shift+q" = "kill";
          "${mod}+q" = "exec ${menu}";
          "${mod}+m" = "exec pavucontrol-qt";
          "${mod}+Shift+m" = "exec pcmanfm-qt";
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
        #  { command = "export-xdg-data-dirs"; }
        { command = "dbus-sway-environment"; }
        { command = "configure-gtk"; }
      ];

      output = {
        "*".bg = "/home/zygot/.config/sway/walpapers/ghibli-city.png fill";
        #"DP-1".adaptive_sync = "off";
      };
    };

    extraConfig = ''
      include theme/default

      input * { tap enabled }

      blur enable
      blur_passes 1
      blur_radius 2
      corner_radius 10
      default_dim_inactive 0.2

      workspace 1 output DP-1
      workspace 2 output DP-1
      workspace 3 output DP-1
      workspace 4 output DP-1
      workspace 5 output DP-1
      workspace 6 output DP-1
      workspace 7 output DP-1
      workspace 8 output DP-1
      workspace 9 output DP-1
      workspace 10 output HDMI-A-1

      exec nm-applet --indicator
    '';
  };

  programs.waybar.enable = true;

  #services.swayidle.enable = true;

  #Gtk
  gtk = {
    enable = true;

    font = {
      package = pkgs.noto-fonts;
      name = "Noto Sans";
      size = 10;
    };

    #gtk2.extraConfig = ''
    #  gtk-cursor-theme-name = "Vanilla-DMZ"
    #  gtk-cursor-theme-size = 0
    #'';

    iconTheme = {
      package = pkgs.gnome.adwaita-icon-theme;
      name = "adwaita-dark";
    };

    theme = {
      name = "Adwaita";
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
      gtk-cursor-theme-name = "Vanilla-DMZ";
      gtk-cursor-theme-size = 0;
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "qtct";
  };

  home.sessionVariables = {
    CLUTTER_BACKEND = "wayland";
    GDK_BACKEND = "wayland,x11";
    GTK_USE_PORTAL = 1;
    MOZ_ENABLE_WAYLAND = 1;
    NIXOS_OZONE_WL = 1;
    QT_AUTO_SCREEN_SCALE_FACTOR = 1;
    QT_QPA_PLATFORM = "wayland;xcb";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = 1;
    XDG_CURRENT_DESKTOP = "sway";
    XDG_SESSION_DESKTOP = "sway";
    XDG_SESSION_TYPE = "wayland";
    XKB_DEFAULT_OPTIONS = "compose:menu";
  };
  xdg.configFile."sway/theme/default".source = config.lib.file.mkOutOfStoreSymlink "${nixConfigDir}/configs/sway/theme/default";
  xdg.configFile."sway/walpapers/bg.png".source = config.lib.file.mkOutOfStoreSymlink "${nixConfigDir}/configs/sway/walpapers/bg.png";
  xdg.configFile."sway/walpapers/bg_nix.png".source = config.lib.file.mkOutOfStoreSymlink "${nixConfigDir}/configs/sway/walpapers/bg_nix.png";
  xdg.configFile."sway/walpapers/zerg1.png".source = config.lib.file.mkOutOfStoreSymlink "${nixConfigDir}/configs/sway/walpapers/zerg1.png";
  xdg.configFile."sway/walpapers/ghibli-garden.png".source = config.lib.file.mkOutOfStoreSymlink "${nixConfigDir}/configs/sway/walpapers/ghibli-garden.png";
  xdg.configFile."sway/walpapers/ghibli-city.png".source = config.lib.file.mkOutOfStoreSymlink "${nixConfigDir}/configs/sway/walpapers/ghibli-city.png";
}
