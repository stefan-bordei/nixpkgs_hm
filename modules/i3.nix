{ config, pkgs, libs, ... }:
let
  nixConfigDir = "${config.home.homeDirectory}/.config/nixpkgs";
in
{
    xdg.configFile."i3/".source = config.lib.file.mkOutOfStoreSymlink "${nixConfigDir}/configs/i3/";
}
