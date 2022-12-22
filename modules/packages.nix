{ config, pkgs, libs, ... }:
let
in {
  home.packages = with pkgs; [
    # utilities
    (python3.withPackages(p: with p; [ pip python-lsp-server requests numpy ]))
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

    # Rust
    rustc
    cargo

    # lsp
    clang
    nodejs
    nodePackages.npm
    rust-analyzer

    # telescope deps
    ripgrep

    # password management
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

    # games
    lutris
    piper
    wine

    # messengers
    (discord.override { nss = pkgs.nss_latest; })

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
    #noto-fonts-emoji
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
