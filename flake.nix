{
  description = "A simple NixOS flake";

  inputs = {
    # NixOS official package source, using the nixos-25.05 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows  = "nixpkgs";
    };
  };

  outputs = {self, home-manager, nixpkgs, ... }@inputs: {
    nixosConfigurations = {
      IUseArchBTW = let
          username = "daniel";
        in nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/X1C
            home-manager.nixosModules.home-manager 
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              home-manager.users.${username} = import ./users/${username}/home.nix;
            }
          ];
       };
    };
  };
}
