{ username, ... }: {

  imports = [
    ../../home/core.nix
    ../../home/dotfiles.nix
    ../../home/programs
  ];

  programs.git = {
    userName = "Daniel Jin";
    userEmail = "mrpickles123115@gmail.com";
  };
}
