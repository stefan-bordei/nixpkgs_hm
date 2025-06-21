{
  config,
  lib,
  pkgs,
  nur,
  ...
}:
let
  nixConfigDir = "${config.home.homeDirectory}/.config/home-manager";
in
{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "zygot";
  home.homeDirectory = "/home/zygot";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.05";

  # Let Home Manager install and manage itself.
  fonts.fontconfig.enable = true;

  # XDG
  xdg.enable = true;
  xdg.portal = {
    enable = true;
    config = {
      common.default = "*";
      sway = {
        default = [
          "wlr"
          "gtk"
        ];
        "org.freedesktop.impl.portal.Secret" = [ "gnome-keyring" ];
        "org.freedesktop.impl.portal.Screenshot" = [ "wlr" ];
        "org.freedesktop.impl.portal.Screencast" = [ "wlr" ];
      };
    };
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-wlr
    ];
    xdgOpenUsePortal = true;
  };

  services = {
    gnome-keyring = {
      enable = true;
      components = [
        "pkcs11"
        "secrets"
        "ssh"
      ];
    };

    network-manager-applet.enable = true;

    # WM notifications
    fnott = {
      enable = true;
      settings = {
        low = {
          title-font = "Source Sans Pro:weight=normal:size=14";
          title-color = "ffffffff";
        };

        normal = {
          title-font = "Source Sans Pro:weight=normal:size=14";
          title-color = "ffffffff";
        };

        critical = {
          title-font = "Source Sans Pro:weight=normal:size=14";
          title-color = "ffffffff";
        };
      };
    };
  };

  programs = {
    home-manager.enable = true;
    direnv.enable = true;
    direnv.nix-direnv.enable = true;

    # WM-related stuff
    fuzzel = {
      enable = true;
      settings.main.terminal = "foot";
    };

    waybar = {
      enable = true;
      package = pkgs.waybar; # pkgs.waybar.override { hyprlandSupport = false; };
      systemd = {
        enable = true;
        # target = "graphical-session.target";
      };
    };

    powerline-go = {
      enable = true;
      extraUpdatePS1 = ''
        if [[ -n "$IN_NIX_SHELL" ]]; then
          export PS1="$PS1(nix-shell): "
        fi
      '';
    };

    bash = {
      enable = true;
      sessionVariables = {
        EDITOR = "nvim";
      };
      initExtra = ''
        . "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
        [ "$(tty)" = "/dev/tty1" ] && exec sway
      '';
    };

    git = {
      enable = true;
      package = pkgs.gitFull;
      userEmail = "stefan.bordei13@gmail.com";
      userName = "stefan-bordei";
      extraConfig = {
        core.editor = "vim";
        url = {
          "ssh://git@github.com" = {
            insteadOf = "https://github.com";
          };
        };
      };
    };

    #  other programs
    alacritty.enable = true;
    bat.enable = true;
    eza.enable = true;
    firefox = {
      enable = true;
      package = pkgs.firefox-bin;
    };
    sioyek = {
      enable = true;
      package = pkgs.sioyek.overrideAttrs (old: {
        buildInputs = old.buildInputs ++ [ pkgs.kdePackages.qtwayland ];
      });
    };
    fzf.enable = true;
    gh.enable = true;
    #gitui.enable = true;
    lazygit.enable = true;
    neovim.enable = true;
    go.enable = true;
    swaylock.settings = {
      color = "000000";
      font-size = 24;
      indicator-idle-visible = false;
      indicator-radius = 100;
      line-color = "ffffff";
      show-failed-attempts = true;
    };
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    TCLLIBPATH = "$HOME/.local/share/tk-themes";
  };
}
