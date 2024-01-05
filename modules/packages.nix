{ config, pkgs, libs, ... }:
let
  #unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
  configure-gtk = pkgs.writeTextFile {
    name = "export-xdg-data-dirs";
    destination = "/bin/configure-gtk";
    executable = true;
    text = let
      schema = pkgs.gsettings-desktop-schemas;
      datadir = "${schema}/share/gsettings-schemas/${schema.name}";
    in ''
      typeset -gx XDG_DATA_DIRS=${datadir}:$XDG_DATA_DIRS
    '';
  };
  dbus-sway-environment = pkgs.writeTextFile {
    name = "dbus-sway-environment";
    destination = "/bin/dbus-sway-environment";
    executable = true;

    text = ''
      dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY SWAYSOCK
      systemctl --user stop pipewire xdg-desktop-portal xdg-desktop-portal-wlr
      systemctl --user start pipewire xdg-desktop-portal xdg-desktop-portal-wlr
    '';
  };
in {
  home.packages = with pkgs; [
    # utilities
    (python3.withPackages(p: with p; [ pip python-lsp-server requests numpy ]))
    asciinema
    htop
    glib # for gsettings
    git-lfs
    gnome.gnome-dictionary
    gsimplecal
    keyd
    lazygit
    neovide
    neovim-qt
    nix-info
    nixfmt
    xarchiver
    xchm
    xdg-utils
    zenmonitor
    obsidian
    nitrogen
    qmk
    gnumake
    tinygo

    # sway
    dconf
    bemenu
    configure-gtk
    dbus-sway-environment
    gnome.adwaita-icon-theme
    grim
    pipectl
    slurp
    swaybg
    swaynotificationcenter
    swaysettings
    swaylock
    wl-clipboard
    wl-color-picker
    wl-mirror
    blackbox-terminal
    hyprpaper
    hyprpicker
    wttrbar
    gtklock
    nwg-look
    nwg-panel
    swww
    networkmanagerapplet
    lxqt.pavucontrol-qt
    pcmanfm-qt
    xdg-desktop-portal-gtk

    # Rust
    rustc
    cargo

    # testing
    vagrant
    virtualbox

    # lsp
    clang
    clang-tools
    nodejs
    nodePackages.npm
    nodePackages.pyright
    rust-analyzer
    gopls

    # telescope deps
    ripgrep

    # password management
    lxqt.lxqt-sudo
    lxqt.lxqt-policykit

    # multimedia
    youtube-dl
    google-chrome
    strawberry

    # broweser
    google-chrome

    # nix-dev
    nixpkgs-review

    # themes
    adwaita-qt
    numix-gtk-theme
    numix-cursor-theme
    numix-icon-theme
    materia-theme
    libsForQt5.qt5ct
    libsForQt5.breeze-qt5
    libsForQt5.breeze-gtk
    themechanger

    # graphics
    nomacs
    krita
    blender
    xf86_input_wacom

    # games
    piper
    vcmi
    protonup-qt
    #lutris
    heroic

    # messengers
    (discord.override { nss = pkgs.nss_latest; })
    #unstable.teams
    zoom

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
