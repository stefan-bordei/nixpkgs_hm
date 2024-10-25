{
  allowUnsupportedSystem = true;
  allowUnfree = true;
  allowBroken = true;
  input-fonts.acceptLicense = true;

  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "steam"
      "steam-original"
      "steam-runtime"
    ];
}
