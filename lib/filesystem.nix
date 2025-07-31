{ config, username } : {
  storagePath = "/home/${username}/.config/nixos";
  homeManagerPath = "${storagePath}/home";
  mkOOSSToHome = path : (config.lib.file.mkOutOfStoreSymlink "${homeManagerPath}/${path}");
}
