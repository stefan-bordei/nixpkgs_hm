{ 
  allowUnsupportedSystem = true; 
  allowUnfree = true;
  allowBroken = true;

  #nixpkgs.localSystem = {
  #  gcc.arch = "znver3";
  #  gcc.tune = "znver3";
  #  system = "x86_64-linux";
  #};

  #packageOverrides = pkgs: {
  #  nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
  #    inherit pkgs;
  #  };
  #};
}
