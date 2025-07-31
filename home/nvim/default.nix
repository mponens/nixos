{ pkgs, config, ... }: {
  home.file.".config/nvim" = {
    source = ./nvim;
    recursive = true;
  };
  home.file.".vimrc".source = ./vimrc;
}
