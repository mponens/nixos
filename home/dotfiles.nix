{ pkgs, config, username, ... }: 
let 
  dotfiles = ./dotfiles;
  sDotfiles = config.lib.file.mkOutOfStoreSymlink ./dotfiles;
in {
  home.file.".config/nvim" = {
	source = "${sDotfiles}/nvim";
    recursive = true;
  };
  home.file.".vimrc".source = "${sDotfiles}/nvim/.vimrc";
}
