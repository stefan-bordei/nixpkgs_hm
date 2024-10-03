{ config, pkgs, ... }: {
  gtk = {
    enable = true;

    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus-Dark";
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
      gtk-cursor-theme-size = 18;
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
      gtk-cursor-theme-size = 18;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "qtct";
  };

  stylix = {
    enable = true;
    polarity = "dark";
    image = /home/zygot/walpapers/ghibli-city.png;
    autoEnable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/default-dark.yaml";

    targets.alacritty.enable = false;
    targets.zathura.enable = false;
    targets.waybar.enable = false;
    targets.swaylock.enable = false;
    targets.sway.enable = false;
    targets.fuzzel.enable = true;
    targets.neovim.enable = false;

    targets.gtk.enable = true;

    fonts = {
      serif = {
        package = pkgs.source-serif;
        name = "Source Serif";
      };

      sansSerif = {
        package = pkgs.inter;
        name = "Inter";
      };

      monospace = {
        package = pkgs.dejavu_fonts;
        name = "Triplicate OT";
      };

      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };

      sizes.applications = 11;
    };
  };
}
