{
  description = "Small shell utilities which ease the life in the CLI";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    nix-systems.url = "github:nix-systems/default";
    ansi = {
      url = "path:./ansi";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nix-systems.follows = "nix-systems";
    };
    ex = {
      url = "path:./ex";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nix-systems.follows = "nix-systems";
    };
    up = {
      url = "path:./up";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nix-systems.follows = "nix-systems";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs:
    let eachSystem = nixpkgs.lib.genAttrs (import inputs.nix-systems);
    in {
      packages = eachSystem (system: {
        ansi = inputs.ansi.packages.${system}.default;
        ex = inputs.ex.packages.${system}.default;
        up = inputs.up.packages.${system}.default;
      });
    };
}
