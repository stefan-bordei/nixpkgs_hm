{ config, pkgs, nur, ... }: {
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

  programs = {
    home-manager = {
	enable = true;
    };
    direnv.enable = true;
    direnv.nix-direnv.enable = true;
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
    QT_QPA_PLATFORMTHEME = "qt5ct";
  };

  services = {
    gnome-keyring.enable = true;
    #picom.enable= true;
  };

  xdg.enable = true;
}
