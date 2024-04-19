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
        ansi = inputs.shell-utils.packages.${system}.ansi;
        dirStack = inputs.dirStack.packages.${system}.default;
        ex = inputs.shell-utils.packages.${system}.ex;
        gen = inputs.gen.packages.${system}.default;
        nixie-clock = inputs.nixie-clock.packages.${system}.default;
        note = inputs.note.packages.${system}.default;
        rgpt = inputs.rgpt.packages.${system}.default;
        translate = inputs.translate.packages.${system}.default;
        up = inputs.shell-utils.packages.${system}.up;
      });
    };
}
