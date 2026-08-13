{ pkgs, lib, username, ... } : {
  users.groups.plugdev = {};
  users.users.${username}.extraGroups = [ "plugdev" "dialout" ];
  services.udev.packages = [
	pkgs.openocd
  ];
}
