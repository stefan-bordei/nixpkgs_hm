{ config, pkgs, libs, ... }:
let
  # currently, there is some friction between sway and gtk:
  # https://github.com/swaywm/sway/wiki/GTK-3-settings-on-Wayland
  # the suggested way to set gtk settings is with gsettings
  # for gsettings to work, we need to tell it where the schemas are
  # using the XDG_DATA_DIR environment variable
  # run at the end of sway config
  #configure-gtk = pkgs.writeTextFile {
  #  name = "configure-gtk";
  #  destination = "/bin/configure-gtk";
  #  executable = true;
  #  text = let
  #    schema = pkgs.gsettings-desktop-schemas;
  #    datadir = "${schema}/share/gsettings-schemas/${schema.name}";
  #  in ''
  #    export XDG_DATA_DIRS=${datadir}:$XDG_DATA_DIRS
  #    gnome_schema=org.gnome.desktop.interface
  #    gsettings set $gnome_schema gtk-theme 'Materia-dark-compact'
  #    gsettings set $gnome_schema icon-theme 'Gnome'
  #    gsettings set $gnome_schema cursor-theme 'Gnome'
  #    gsettings set $gnome_schema font-name 'Source Sans 10'
   # '';
  #};
in {
  home.packages = with pkgs; [
    # utilities
    (python3.withPackages(p: with p; [ requests ]))
    asciinema
    htop
    glib # for gsettings
    git-lfs
    gitter
    gnome.gnome-dictionary
    gsimplecal
    keyd
    lazygit
    neovide
    neovim-qt
    nix-info
    nixfmt
    xarchiver
    xdg-utils
    zenmonitor
    obsidian

    # password management
    #keepassxc
    lxqt.lxqt-sudo
    lxqt.lxqt-policykit

    # multimedia
    youtube-dl

    # themes
    adwaita-qt
    numix-gtk-theme
    numix-cursor-theme
    numix-icon-theme
    materia-theme
    libsForQt5.breeze-qt5
    libsForQt5.breeze-gtk
    themechanger

    # graphics
    nomacs

    # messengers
    discord

    # fonts
    b612
    camingo-code
    cascadia-code
    corefonts
    d2coding
    fira-code
    font-awesome_4
    go-font
    hack-font
    hermit
    ibm-plex
    jetbrains-mono
    julia-mono
    liberation_ttf
    libertine
    lmodern
    meslo-lg
    noto-fonts-emoji
    fira-code-symbols
    overpass
    recursive
    redhat-official-fonts
    rictydiminished-with-firacode
    siji
    source-code-pro
    source-sans
    vistafonts
    line-awesome
    inconsolata-nerdfont

    # latex
    texlive.combined.scheme-full
    poppler_utils
    jabref
    kbibtex
    pandoc
    #jetbrains-mono
  ];
}
