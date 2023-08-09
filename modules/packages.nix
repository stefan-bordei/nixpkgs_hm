{ config, pkgs, libs, ... }:
let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
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
    nitrogen
    qmk
    gnumake

    # Rust
    rustc
    cargo

    # lsp
    clang
    nodejs
    nodePackages.npm
    rust-analyzer
    gopls

    # telescope deps
    ripgrep

    # password management
    lxqt.lxqt-sudo
    lxqt.lxqt-policykit

    # multimedia
    youtube-dl

    # nix-dev
    nixpkgs-review

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
    piper
    unstable.vcmi

    # messengers
    (discord.override { nss = pkgs.nss_latest; })

    # ebooks
    calibre

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
