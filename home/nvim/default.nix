{ pkgs, config, username, ... }: 
let 
  fs = import ../../lib/filesystem.nix { inherit config username; };
in {
  home.file.".config/nvim" = {
    # source = config.lib.file.mkOutOfStoreSymlink ./nvim;
	# source = (myLib.filesystem.mkOOSSToHome "nvim/nvim");
	source = fs.mkOOSSToHome "nvim/nvim";
    recursive = true;
  };
  home.file.".vimrc".source = ./vimrc;
}
