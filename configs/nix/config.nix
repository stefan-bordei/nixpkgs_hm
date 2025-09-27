{
  allowUnsupportedSystem = true;
  allowUnfree = true;
  allowBroken = true;

  nixpkgs.localSystem = {
    gcc.arch = "x86-64-v3";
    gcc.tune = "x86-64-v3";
    system = "x86_64-linux";
  };
}
