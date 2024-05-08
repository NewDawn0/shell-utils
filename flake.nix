{
  description = "Small shell utilities which ease the life in the CLI";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    nix-systems.url = "github:nix-systems/default";
  };
  outputs = { self, nixpkgs, ... }@inputs:
    let
      eachSystem = nixpkgs.lib.genAttrs (import inputs.nix-systems);
      mkPkgs = system:
        import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
    in {
      packages = eachSystem (system:
        let pkgs = mkPkgs system;
        in with builtins;
        with pkgs.lib.attrsets;
        listToAttrs (map (u: {
          name = u;
          value = import ./${u} { inherit pkgs; };
        }) (filter (f: f != "tmp")
          (attrNames (filterAttrs (_: v: v == "directory") (readDir ./.))))));
    };
}
