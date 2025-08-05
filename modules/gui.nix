{ pkgs, lib, username, ... } : {

  services.xserver = {
    enable = true;
    windowManager.awesome = {
      enable = true;
      luaModules = with pkgs.luaPackages; [
        luarocks
        luadbi-mysql
	      awesome-wm-widgets
      ];
    };
  };

  services.clipmenu.enable = true;

  services.picom = {
    enable = true;
    backend = "glx";
    vSync = true;
  };

  services.displayManager = {
    sddm.enable = true;
    defaultSession = "none+awesome";
  };


  programs = {
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
  };
}
