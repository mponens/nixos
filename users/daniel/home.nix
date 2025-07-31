{ username, ... }: {
  home.username = ${username};
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "25.05";

  imports = [
    ../../home/programs
  ];

  programs.git = {
    userName = "Daniel Jin";
    userEmail = "mrpickles123115@gmail.com";
  };
}
