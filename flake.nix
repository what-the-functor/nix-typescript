{
  description = "Typescript development environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        pkgs-unstable = import nixpkgs-unstable { inherit system; };

      in {
        devShells = {

          # Default environment for typescript and javascript development
          default = pkgs.mkShell {
            packages = [
              pkgs.nodePackages.eslint
              pkgs.nodePackages.live-server
              pkgs.nodePackages.prettier
              pkgs.nodePackages.typescript
              pkgs-unstable.nodePackages.typescript-language-server
              pkgs.nodePackages.vscode-langservers-extracted
            ];
          };

          # Nix environment for development of this flake
          # Additionally pandoc is used for markdown support
          # See .envrc at the root of this project
          nix = pkgs.mkShell { packages = with pkgs; [ nil nixfmt pandoc ]; };
        };
      });
}
