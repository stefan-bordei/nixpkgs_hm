{ config, pkgs, ... }:
{

  services.wlsunset = {
    enable = true;
    latitude = "53.3498";
    longitude = "6.2603";
    temperature.night = 3000;
  };

  services.kanshi = {
    enable = true;

    settings = [
      {
        profile.outputs = [
          {
            criteria = "eDP-1";
            status = "enable";
            position = "1920,0";
          }
          {
            criteria = "DP-9";
            status = "enable";
            position = "0,0";
          }
        ];
      }
    ];
  };
}
