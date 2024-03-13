{ config, pkgs, ... }: {

  services.wlsunset = {
    enable = true;
    latitude = "53.3498";
    longitude = "6.2603";
    temperature.night = 3000;
  };

  services.kanshi = {
    enable = true;

    profiles = {
      lair = {
        outputs = [
          {
            criteria = "eDP-1";
            status = "enable";
            position = "1920,0";
          }
          {
            criteria = "DP-10";
            status = "enable";
            position = "0,0";
          }
        ];
      };
      ziggurat = {
        outputs = [
          {
            criteria = "eDP-1";
            status = "enable";
            position = "1920,0";
          }
          {
            criteria = "HDMI-A-2";
            status = "enable";
            position = "0,0";
          }
        ];
      };
    };
  };

}
