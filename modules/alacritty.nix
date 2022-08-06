{ config, pkgs, libs, ... }: 
let 
  nixConfigDir = "${config.home.homeDirectory}/.config/nixpkgs";
in
{
    programs.neovim = {
      enable = true;
      ];
    }; # alacritty 
    xdg.configFile."alacritty.yml".source = config.lib.file.mkOutOfStoreSymlink "${nixConfigDir}/configs/alacritty";
}
