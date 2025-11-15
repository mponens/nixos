{ pkgs, config, username, ... }: 
let 
  dotfiles = config.lib.file.mkOutOfStoreSymlink /home/${username}/.config/nixos/home/dotfiles;
  iDotfiles = ./dotfiles; # Immutable config
in {
  home.file.".config/nvim" = {
    source = "${dotfiles}/nvim";
    recursive = true;
  };
  home.file.".vimrc".source = "${dotfiles}/nvim/.vimrc";

  home.file.".config/awesome" = {
    source = "${dotfiles}/awesome";
    recursive = true;
  };

  home.file.".tmux.conf".source = "${dotfiles}/tmux/tmux.conf";
  home.file.".tmux/plugins/tpm" = {
    source = pkgs.fetchFromGitHub {
	  owner = "tmux-plugins";
	  repo = "tpm";
	  rev = "99469c4a9b1ccf77fade25842dc7bafbc8ce9946";
      hash = "sha256-hW8mfwB8F9ZkTQ72WQp/1fy8KL1IIYMZBtZYIwZdMQc=";
	};
	recursive = true;
  };

  home.file.".config/kitty" = {
    source = "${dotfiles}/kitty";
	recursive = true;
  };

}
