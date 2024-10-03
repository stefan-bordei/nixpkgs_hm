{
  description = "Home Manager Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/master";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    foolnotion = {
      url = "github:foolnotion/nur-pkg";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils.url = "github:numtide/flake-utils";
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    { self, home-manager, nixpkgs, flake-utils, hyprland, foolnotion, stylix, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        overlays = [ foolnotion.overlay ];
        config = {
          allowUnsupportedSystem = true;
          allowUnfree = true;
          allowBroken = true;
        };
      };
    in {
      homeConfigurations.zygot = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
          ./home.nix
          ./modules/alacritty.nix
          ./modules/neovim.nix
          ./modules/tmux.nix
          ./modules/sway.nix
          ./modules/waybar.nix
          ./modules/packages.nix
          ./modules/kanshi.nix
          ./modules/theme.nix
          stylix.homeManagerModules.stylix
        ];
      };

      zygot = self.homeConfigurations.zygot.activationPackage;
      defaultPackage.${system} = self.zygot;
    };
}
