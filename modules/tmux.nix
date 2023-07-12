{ config, pkgs, libs, ... }:
let
  nixConfigDir = "${config.home.homeDirectory}/.config/nixpkgs";
in
{
    programs.tmux = {
      enable = true;
      clock24 = true;

      plugins = with pkgs.tmuxPlugins; [
        { plugin = vim-tmux-navigator; }
        { plugin = sensible; }
      ];

      extraConfig = ''
        set -g default-terminal "xterm-256color"
        set -ga terminal-overrides ",*256col*:Tc"
        set -ga terminal-overrides '*:Ss=\E[%p1%d q:Se=\E[ q'
        set-environment -g COLORTERM "truecolor"

        # Mouse works as expected
        set-option -g mouse on
        set -g base-index 1
        set -g pane-base-index 1
      '';

    }; # tmux
}
