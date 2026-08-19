{
  description = "A simple NixOS flake";

  inputs = { 
  # Dotfiles is a submodule
    self.submodules = true;
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
	nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows  = "nixpkgs";

    };
  };

  outputs = {self, home-manager, nixpkgs, nixpkgs-unstable, sops-nix, ... }@inputs:
  let
	system = "x86_64-linux";
	unstablePkgs = import nixpkgs-unstable {
	  inherit system;
	};
	unstableOverlay = final: prev: {
	  unstable = unstablePkgs;
	};

  in {
	nixosConfigurations = {
	  IUseArchBTW = let
		  username = "daniel";
		  specialArgs = { inherit username; };
	  in nixpkgs.lib.nixosSystem {
		inherit system specialArgs;
		modules = [
		  ./hosts/X1C
		  sops-nix.nixosModules.sops
		  home-manager.nixosModules.home-manager 
		  {
			nixpkgs.overlays = [ unstableOverlay ];
		  }
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

	  Leleif = let
		username = "daniel";
		specialArgs = { inherit username; };
	  in nixpkgs.lib.nixosSystem {
		inherit system specialArgs;
		modules = [
		  ./hosts/Leleif
		  sops-nix.nixosModules.sops
		  home-manager.nixosModules.home-manager 
		  {
			nixpkgs.overlays = [ unstableOverlay ];
		  }
		  {
			home-manager.useGlobalPkgs = true;
			home-manager.useUserPackages = true;

			home-manager.extraSpecialArgs = inputs // specialArgs;
			home-manager.users.${username} = import ./users/${username}/home-min.nix; # Use minimal version
		  }
		  {
			nix.settings.trusted-users = [username];
		  }
		];
	  };

	  Sakamoto = let
		username = "daniel";
		specialArgs = { inherit username; };
	  in nixpkgs.lib.nixosSystem {
		inherit system specialArgs;
		modules = [
		  ./hosts/Sakamoto
		  sops-nix.nixosModules.sops
		  home-manager.nixosModules.home-manager 
		  {
			nixpkgs.overlays = [ unstableOverlay ];
		  }
		  {
			home-manager.useGlobalPkgs = true;
			home-manager.useUserPackages = true;

			home-manager.extraSpecialArgs = inputs // specialArgs;
			home-manager.users.${username} = import ./users/${username}/home.nix; # Use minimal version
		  }
		  {
			nix.settings.trusted-users = [username];
		  }
		];
	  };

	  Linode = let
		username = "daniel";
		specialArgs = { inherit username; };
	  in nixpkgs.lib.nixosSystem {
		inherit system specialArgs;
		modules = [
		  ./hosts/Linode
		  sops-nix.nixosModules.sops
		  home-manager.nixosModules.home-manager 
		  {
			nixpkgs.overlays = [ unstableOverlay ];
		  }
		  {
			home-manager.useGlobalPkgs = true;
			home-manager.useUserPackages = true;

			home-manager.extraSpecialArgs = inputs // specialArgs;
			home-manager.users.${username} = import ./users/${username}/home-bare.nix; # Use minimal version
		  }
		  {
			nix.settings.trusted-users = [username];
		  }
		];
	  };
	  Miramei = let
		  username = "daniel";
		  specialArgs = { inherit username; };
	  in nixpkgs.lib.nixosSystem {
		inherit system specialArgs;
		modules = [
		  ./hosts/Miramei
		  sops-nix.nixosModules.sops
		  home-manager.nixosModules.home-manager 
		  {
			nixpkgs.overlays = [ unstableOverlay ];
		  }
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

	  IUseNyarchBTW = let
		  username = "daniel";
		  specialArgs = { inherit username; };
	  in nixpkgs.lib.nixosSystem {
		inherit system specialArgs;
		modules = [
		  ./hosts/X220
		  sops-nix.nixosModules.sops
		  home-manager.nixosModules.home-manager 
		  {
			nixpkgs.overlays = [ unstableOverlay ];
		  }
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
