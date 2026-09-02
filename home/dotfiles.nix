{ pkgs, config, username, ... }: 
let 
  dotfiles = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.config/nixos/home/dotfiles";
in {
  home.file.".config/nvim".source = "${dotfiles}/nvim";
  home.file.".config/niri".source = "${dotfiles}/niri";
  home.file.".config/waybar".source = "${dotfiles}/waybar";
  home.file.".config/mako".source = "${dotfiles}/mako";
  home.file.".vimrc".source = "${dotfiles}/nvim/.vimrc";
  home.file.".config/awesome".source = "${dotfiles}/awesome";
  home.file.".config/kitty".source = "${dotfiles}/kitty";

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


}
