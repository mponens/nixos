{
  description = "A simple NixOS flake";

  inputs = { 
  # Dotfiles is a submodule
    self.submodules = true;
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows  = "nixpkgs";

    };
  };

  outputs = {self, home-manager, nixpkgs, sops-nix, ... }@inputs: {
    nixosConfigurations = {
      IUseArchBTW = let
          username = "daniel";
          specialArgs = { inherit username; };
      in nixpkgs.lib.nixosSystem {
      inherit specialArgs;
        system = "x86_64-linux";
        modules = [
          ./hosts/X1C
          sops-nix.nixosModules.sops
          home-manager.nixosModules.home-manager 
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.extraSpecialArgs = inputs // specialArgs;
            home-manager.users.${username} = import ./users/${username}/home.nix;
          }
		  {
			nix.settings.trusted-users = [username];
		  }
        ];
      };
    };
  };
}
