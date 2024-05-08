# shell-utils
Some useful shell utilites
Inquire more information about a utility in the README of the utility's directory

## Installation
### Imperatively
```bash
git clone https://github.com/NewDawn0/shell-utils
nix profile install .
```
### Declaratively
1. Add it as an input to your system flake as follows
    ```nix
    {
      inputs = {
        # Your other inputs ...
        shell-utils = {
          url = "github:NewDawn0/shell-utils";
          inputs.nixpkgs.follows = "nixpkgs";
          # Optional: If you use nix-systems or rust-overlay
          inputs.nix-systems.follows = "nix-systems";
        };
      };
    }
    ```
2. Add this to your overlays to expose shell-utils to your pkgs
    ```nix
    (final: prev: {
      ansi = inputs.shell-utils.packages.${prev.system}.ansi;
      ex = inputs.shell-utils.packages.${prev.system}.ex;
      up = inputs.shell-utils.packages.${prev.system}.up;
    })
    ```
3. Then you can either install it in your `environment.systemPackages` using 
    ```nix
    environment.systemPackages = with pkgs; [ ansi ex up ];
    ```
    or install it to your `home.packages`
    ```nix
    home.packages = with pkgs; [ ansi ex up ];
    ```
**Note**: You are able to install the packages individually aswell using either its `default.nix` or `flake.nix`
**Note**: If you use up don't forget to initalize it using the install instructions in `./up/README.md`
