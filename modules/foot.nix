{
  programs.foot = {
    enable = true;
    settings = {
      main = {
        term = "xterm-256color";
        font = "DejaVu Sans Mono:size=10.8";
        dpi-aware = "auto";
        line-height = "14";
        vertical-letter-offset = "2";
      };

      mouse = { hide-when-typing = "yes"; };

      colors = {
        "foreground" = "dddddd";
        "background" = "000000";
        "regular0" = "000000"; # black
        "regular1" = "cc0403"; # red
        "regular2" = "19cb00"; # green
        "regular3" = "cecb00"; # yellow
        "regular4" = "0d73cc"; # blue
        "regular5" = "cb1ed1"; # magenta
        "regular6" = "0dcdcd"; # cyan
        "regular7" = "dddddd"; # white
        "bright0" = "767676"; # bright black
        "bright1" = "f2201f"; # bright red
        "bright2" = "23fd00"; # bright green
        "bright3" = "fffd00"; # bright yellow
        "bright4" = "1a8fff"; # bright blue
        "bright5" = "fd28ff"; # bright magenta
        "bright6" = "14ffff"; # bright cyan
        "bright7" = "ffffff"; # bright white
      };
    };
  };
}
