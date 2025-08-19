{ pkgs, username, ... }: {

  imports = [
    ../../home/core.nix
    ../../home/dotfiles.nix
    ../../home/programs/ctf.nix
    ../../home/programs/common.nix
    ../../home/programs/development.nix
    ../../home/programs/entertainment.nix
    ../../home/programs/nvim.nix
  ];

  programs.git = {
    userName = "Daniel Jin";
    userEmail = "mrpickles123115@gmail.com";
  };
}
