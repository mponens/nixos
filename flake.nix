{
  description = "A simple NixOS flake";

  inputs = { 
  	self.submodules = true;
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
	      specialArgs = { inherit username; };
      in nixpkgs.lib.nixosSystem {
	    inherit specialArgs;
        system = "x86_64-linux";
        modules = [
          ./hosts/X1C
          home-manager.nixosModules.home-manager 
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

	        home-manager.extraSpecialArgs = inputs // specialArgs;
            home-manager.users.${username} = import ./users/${username}/home.nix;
          }
        ];
      };
    };
  };
}
