{ pkgs, config, myLib, ... }: {
  home.file.".config/nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink ./nvim;
	# source = myLib.filesystem.mkOOSSToHome "nvim/nvim";
    recursive = true;
  };
  home.file.".vimrc".source = ./vimrc;
}
