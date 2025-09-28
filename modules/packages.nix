{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    # utilities
    (python3.withPackages (
      p: with p; [
        pip
        python-lsp-server
        requests
        numpy
      ]
    ))
    asciinema
    htop
    glib # for gsettings
    git-lfs
    gsimplecal
    keyd
    lazygit
    neovide
    neovim-qt
    nix-info
    nixfmt-rfc-style
    xarchiver
    xchm
    xdg-utils
    zenmonitor
    obsidian
    nitrogen
    gnumake
    unzip

    # sway
    bemenu
    grim
    pipectl
    slurp
    swaybg
    swaylock
    wl-clipboard
    wl-color-picker
    wl-mirror
    blackbox-terminal
    wttrbar
    gtklock
    lxqt.pavucontrol-qt
    pcmanfm-qt
    brightnessctl
    xwayland-satellite

    # k8s
    k3d

    # Rust
    rustc
    cargo

    # lsp
    clang
    clang-tools
    #nodejs
    nodePackages.npm
    pyright
    rust-analyzer
    gopls
    lua-language-server
    nixd
    kotlin-language-server
    ktlint
    stylua

    # telescope deps
    ripgrep

    # password management
    lxqt.lxqt-sudo
    lxqt.lxqt-policykit

    # useful tools from lxqt
    lxqt.lximage-qt
    lxqt.lxqt-archiver
    lxqt.lxqt-config
    lxqt.lxqt-openssh-askpass
    lxqt.lxqt-panel
    lxqt.lxqt-qtplugin
    lxqt.pavucontrol-qt
    lxqt.pcmanfm-qt
    lxqt.qterminal
    lxappearance
    qpwgraph
    xwayland-satellite

    # multimedia
    (strawberry.override {
      #withVlc = false;
      #withGstreamer = true;
    })

    # music
    reaper
    guitarix
    drumgizmo
    gxplugins-lv2
    neural-amp-modeler-lv2

    # broweser
    brave
    google-chrome

    # nix-dev
    nixpkgs-review

    # keyboard
    qmk

    # themes
    libsForQt5.qt5ct
    kdePackages.qt6ct
    adwaita-qt
    adwaita-qt6
    yaru-theme
    libsForQt5.qt5.qtwayland
    kdePackages.qtwayland

    # graphics
    nomacs
    #krita
    #blender
    #xf86_input_wacom

    # games
    vcmi
    heroic
    katago
    q5go

    # messengers
    (discord.override { nss = pkgs.nss_latest; })
    #unstable.teams
    unstable.zoom-us

    # ebooks
    calibre
    pdftk

    # fonts
    _0xproto
    apl386
    b612
    borg-sans-mono
    camingo-code
    cascadia-code
    charis-sil
    commit-mono
    corefonts
    d2coding
    dejavu_fonts
    fira-code
    font-awesome_4
    font-awesome
    go-font
    hack-font
    hermit
    hasklig
    hubot-sans
    ibm-plex
    intel-one-mono
    inter
    jetbrains-mono
    julia-mono
    liberation_ttf
    libertine
    line-awesome
    lmodern
    #maple-mono
    meslo-lgs-nf
    monaspace
    mona-sans
    monocraft
    noto-fonts
    noto-fonts-emoji
    overpass
    public-sans
    recursive
    redhat-official-fonts
    rictydiminished-with-firacode
    roboto-mono
    siji
    source-sans
    source-serif
    source-code-pro
    sudo-font
    terminus_font
    terminus_font_ttf
    victor-mono
    vistafonts
    line-awesome
  ];
}
