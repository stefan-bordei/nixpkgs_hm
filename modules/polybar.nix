{ config, pkgs, libs, ... }:
let
  nixConfigDir = "${config.home.homeDirectory}/.config/nixpkgs";
in
{
    xdg.configFile."polybar/config".source = config.lib.file.mkOutOfStoreSymlink "${nixConfigDir}/configs/polybar/config";
    xdg.configFile."polybar/launch.sh".source = config.lib.file.mkOutOfStoreSymlink "${nixConfigDir}/configs/polybar/launch.sh";
    xdg.configFile."polybar/weather.sh".source = config.lib.file.mkOutOfStoreSymlink "${nixConfigDir}/configs/polybar/weather.sh";
}
