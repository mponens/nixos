{ username, ... }: {

  imports = [
    ../../home/core.nix
    ../../home/nvim
    ../../home/programs
  ];

  programs.git = {
    userName = "Daniel Jin";
    userEmail = "mrpickles123115@gmail.com";
  };
}
