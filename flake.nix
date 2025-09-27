{
  description = "Home Manager Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/master";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
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
    {
      self,
      home-manager,
      nixpkgs,
      nixpkgs-unstable,
      flake-utils,
      hyprland,
      foolnotion,
      stylix,
      ...
    }:
    let
      system = "x86_64-linux";
      unstableOverlay = final: prev: {
        unstable = import nixpkgs-unstable {
          system = "x86_64-linux";
          config = {
            allowUnfree = true;
          };
        };
      };
      pkgs = import nixpkgs {
        inherit system;
        overlays = [
          foolnotion.overlay
          unstableOverlay
        ];
        config = {
          allowUnsupportedSystem = true;
          allowUnfree = true;
          allowBroken = true;
        };
      };
    in
    {
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
          stylix.homeModules.stylix
        ];
      };

      zygot = self.homeConfigurations.zygot.activationPackage;
      defaultPackage.${system} = self.zygot;
    };
}
