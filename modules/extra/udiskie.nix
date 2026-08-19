{ username, ... }:

{
  services.udisks2.enable = true;
  services.gvfs.enable = true;

  home-manager.users.${username}.services.udiskie = {
    enable = true;
    automount = true;
    notify = true;
    tray = "auto";
  };
}
