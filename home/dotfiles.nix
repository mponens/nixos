{ pkgs, config, username, ... }: 
let 
  dotfiles = config.lib.file.mkOutOfStoreSymlink /home/${username}/.config/nixos/home/dotfiles;
in {
  home.file.".config/nvim" = {
	source = "${dotfiles}/nvim";
    recursive = true;
  };
  home.file.".vimrc".source = "${dotfiles}/nvim/.vimrc";
}
