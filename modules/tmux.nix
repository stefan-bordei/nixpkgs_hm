{ config, pkgs, libs, ... }:
let
  nixConfigDir = "${config.home.homeDirectory}/.config/nixpkgs";
in
{
    programs.neovim = {
      enable = true;
      plugins = with pkgs.vimPlugins; [
        { plugin = vim-tmux-navigator; }
        { plugin = sensible; }
      ];
    }; # neovim
    xdg.configFile."tmux/".source = config.lib.file.mkOutOfStoreSymlink "${nixConfigDir}/configs/tmux/";
}
