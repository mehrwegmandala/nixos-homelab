{
	description = "NixOS Home for HP ProDesk";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
	};

	outputs = { self, nixpkgs, ... }: {
		nixosConfigurations.prodesk = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			modules = [
				./hosts/prodesk
			];
		};
	};

}
