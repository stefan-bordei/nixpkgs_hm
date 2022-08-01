{ config, pkgs, ... }:
let 
  nixConfigDir = "${config.home.homeDirectory}/.config/nixpkgs";
in
{
    programs.kakoune = {
      enable = true;
      plugins = with pkgs; [
        kakounePlugins.kak-lsp
        kakounePlugins.kak-fzf
        kakounePlugins.pandoc-kak
      #  { plugin = kakounePlugins.fzf-kak; }
      #  { plugin = kakounePlugins.pandoc-kak; }
      ];
    }; # kakoune 
}

