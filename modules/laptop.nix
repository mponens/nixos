{ pkgs, ... } : {
  services.tlp = {
    enable = true;
    settings = {
      STOP_CHARGE_THRESH_BAT0 = 80;
    };
  };

  services.libinput.enable = true;

  environment.systemPackages = with pkgs; [
    brightnessctl
  ];
}
