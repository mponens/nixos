{ config, username } : 
let
  storagePath = "/home/${username}/.config/nixos";
  homeManagerPath = "${storagePath}/home";
  testPath = ./nvim;
in {
  inherit storagePath homeManagerPath testPath;
  mkOOSSToHome = path: 
    let 
	  dest = "${homeManagerPath}/${path}";
	  result = config.lib.file.mkOutOfStoreSymlink dest;
    in builtins.trace "mkOOSSToHome result: ${toString result} with dest ${toString dest}" result;
}
