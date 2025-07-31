{ config, username } : {
  storagePath = "/home/${username}/.config/nixos";
  homeManagerPath = "${storagePath}/home";
  mkOOSSHome = path : (config.lib.file.mkOutOfStoreSymlink "${homeManagerPath}/${path}");
}
