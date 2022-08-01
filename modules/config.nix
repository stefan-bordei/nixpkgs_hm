{ 
  allowUnsupportedSystem = true; 
  allowUnfree = true;
  allowBroken = true;
  input-fonts.acceptLicense = true;

  nixpkgs.localSystem = {
    gcc.arch = "znver3";
    gcc.tune = "znver3";
    system = "x86_64-linux";
  };
}
