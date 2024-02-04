{
  description = "Typescript development environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = import nixpkgs { inherit system; };

      in {
        devShells = {

          # Default environment for typescript and javascript development
          default = pkgs.mkShell {
            packages = [
              pkgs.nodePackages.typescript
              pkgs.nodePackages.typescript-language-server
            ];
          };

          # Nix environment for development of this flake
          # Additionally pandoc is used for markdown support
          # See .envrc at the root of this project
          nix = pkgs.mkShell { packages = with pkgs; [ nil nixfmt pandoc ]; };
        };
      });
}
