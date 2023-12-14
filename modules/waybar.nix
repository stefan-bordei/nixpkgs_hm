{ config, pkgs, libs, ... }:
let
  nixConfigDir = "${config.home.homeDirectory}/.config/home-manager";
in
{
    xdg.configFile."waybar/config".source = config.lib.file.mkOutOfStoreSymlink "${nixConfigDir}/configs/waybar/config";
    xdg.configFile."waybar/style.css".source = config.lib.file.mkOutOfStoreSymlink "${nixConfigDir}/configs/waybar/style.css";
    xdg.configFile."waybar/gruvbox.css".source = config.lib.file.mkOutOfStoreSymlink "${nixConfigDir}/configs/waybar/gruvbox.css";
}
