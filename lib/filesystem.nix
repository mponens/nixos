{ config, username } : 
let
  storagePath = "/home/${username}/.config/nixos";
  homeManagerPath = "${storagePath}/home";
in {
  inherit storagePath homeManagerPath;
  mkOOSSToHome = path : config.lib.file.mkOutOfStoreSymlink "${homeManagerPath}/${path}";
}
