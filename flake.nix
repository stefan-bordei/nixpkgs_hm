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
  };
  outputs =
    { self, home-manager, nixpkgs, flake-utils, hyprland, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        overlays = [ foolnotion.overlay ];
        config = {
          allowUnsupportedSystem = true;
          allowUnfree = true;
          allowBroken = true;
          permittedInsecurePackages = [
                "openjdk-18+36"
		"electron-25.9.0"
              ];
        };
      };
    in {
      homeConfigurations.zygot = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
          ./modules/alacritty.nix
          #./modules/i3.nix
          ./modules/polybar.nix
          ./modules/neovim.nix
          ./modules/tmux.nix
          ./modules/packages.nix
          ./modules/sway.nix
          ./modules/waybar.nix
          ./home.nix
        ];
      };

      zygot = self.homeConfigurations.zygot.activationPackage;
      defaultPackage.${system} = self.zygot;
    };
}
