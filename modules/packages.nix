{ config, pkgs, libs, ... }:
let
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
