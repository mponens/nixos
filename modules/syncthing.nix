{ pkgs, lib, username, ... } : {

  services.syncthing = {
    enable = true;
    user = "${username}";
    dataDir = "/home/${username}/syncthing";
    openDefaultPorts = true;
    extraFlags = [ "--no-default-folder" ];
  };

}
