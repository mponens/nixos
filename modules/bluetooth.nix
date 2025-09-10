{ pkgs, lib, username, ... } : {

  hardware.bluetooth = {
    enable = true;
	powerOnBoot = true;
  };
  services.blueman.enable = true;

}
