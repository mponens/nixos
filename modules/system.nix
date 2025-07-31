{ pkgs, lib, username, ... } : {
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config = {
    allowUnfree = true;
  };

  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
    ];
  };

  services.syncthing = {
    enable = true;
    user = "${username}";
    dataDir = "/home/${username}/syncthing";
    openDefaultPorts = true;
    extraFlags = [ "--no-default-folder" ];
  };

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };
  services.printing.enable = true;

  environment.systemPackages = with pkgs; [
    vim 
    wget
  ];

}
