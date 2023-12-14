{ config, pkgs, libs, ... }: 
let 
  nixConfigDir = "${config.home.homeDirectory}/.config/home-manager";
in
{
    programs.neovim = {
      enable = true;
    }; # alacritty 
    xdg.configFile."alacritty.yml".source = config.lib.file.mkOutOfStoreSymlink "${nixConfigDir}/configs/alacritty/alacritty.yml";
}
