{ config, hyprland, pkgs, ...}: {
  wayland.windowManager.hyprland = {
    enable = true;

    xwayland = {
      enable = true;
      hidpi = false;
    };

    extraConfig = ''
      exec-once = waybar & sway-wallpaper

      $mod = SUPER

      misc {
        vrr = 1
        groupbar_gradients = false
        groupbar_titles_font_size = 10
      }

      input {
        follow_mouse = 1
        kb_layout = us
      }

      general {
        border_size = 1
        gaps_in = 0
        gaps_out = 0
        #col.group_border_active = rgb(435BBE)
        col.group_border_active = rgb(494949)
        col.group_border = rgb(1B1B1B)
      }

      decoration {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more

        rounding = 0
        blur = true
        blur_size = 3
        blur_passes = 1
        blur_new_optimizations = true

        drop_shadow = true
        shadow_range = 4
        shadow_render_power = 3
        col.shadow = rgba(1a1a1aee)
      }

      bind = $mod,Q,exec,bemenu-run
      bind = $mod SHIFT,Q,killactive
      bind = $mod,F,fullscreen
      bind = $mod,Return,exec,foot
      bind = $mod,m,exec,pavucontrol-qt
      #bind = Print,exec,slurp | grim -g - - | wl-copy


      # monitors
      monitor=DP-1,2560x1440,0x0,1
      monitor=HDMI-A-1,3840x2160@60.000000,2560x0,1

      # workspaces
      bind = $mod, Space, togglefloating
      bind = $mod, P, pseudo, # dwindle
      bind = $mod, J, togglesplit, # dwindle
      bind = $mod, W, togglegroup # groupped/tabbed
      bind = $mod, Next, changegroupactive, f
      bind = $mod, Prior, changegroupactive, b
      bind = $mod SHIFT, N, changegroupactive, f
      bind = $mod SHIFT, P, changegroupactive, b

      # Move focus with mainMod + arrow keys
      bind = $mod, left, movefocus, l
      bind = $mod, right, movefocus, r
      bind = $mod, up, movefocus, u
      bind = $mod, down, movefocus, d

      # Switch workspaces with mod + [0-9]
      bind = $mod, 1, workspace, 1
      bind = $mod, 2, workspace, 2
      bind = $mod, 3, workspace, 3
      bind = $mod, 4, workspace, 4
      bind = $mod, 5, workspace, 5
      bind = $mod, 6, workspace, 6
      bind = $mod, 7, workspace, 7
      bind = $mod, 8, workspace, 8
      bind = $mod, 9, workspace, 9
      bind = $mod, 0, workspace, 10

      # Move active window to a workspace with mod + SHIFT + [0-9]
      bind = $mod SHIFT, 1, movetoworkspace, 1
      bind = $mod SHIFT, 2, movetoworkspace, 2
      bind = $mod SHIFT, 3, movetoworkspace, 3
      bind = $mod SHIFT, 4, movetoworkspace, 4
      bind = $mod SHIFT, 5, movetoworkspace, 5
      bind = $mod SHIFT, 6, movetoworkspace, 6
      bind = $mod SHIFT, 7, movetoworkspace, 7
      bind = $mod SHIFT, 8, movetoworkspace, 8
      bind = $mod SHIFT, 9, movetoworkspace, 9
      bind = $mod SHIFT, 0, movetoworkspace, 10

      # Scroll through existing workspaces with mod + scroll
      bind = $mod, mouse_down, workspace, e+1
      bind = $mod, mouse_up, workspace, e-1

      # Move/resize windows with mod + LMB/RMB and dragging
      bindm = $mod, mouse:272, movewindow
      bindm = $mod, mouse:273, resizewindow
      '';
  };

  programs.waybar = {
    enable = true;
    #package = hyprland.packages.${pkgs.system}.waybar-hyprland;
    package = pkgs.waybar-hyprland;
  };

  home.sessionVariables = {
    CLUTTER_BACKEND = "wayland";
    GDK_BACKEND = "wayland,x11";
    GTK_USE_PORTAL = 1;
    MOZ_ENABLE_WAYLAND = 1;
    NIXOS_OZONE_WL = 1;
    QT_AUTO_SCREEN_SCALE_FACTOR = 1;
    QT_QPA_PLATFORM = "wayland;xcb";
    QT_QPA_PLATFORMTHEME = "qt5ct";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = 1;
    SDL_VIDEODRIVER = "wayland";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    XKB_DEFAULT_OPTIONS = "compose:menu";
  };
}

