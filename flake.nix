
{
  description = "Rustlings environment with Rust, rustup, and rustlings";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { 
    nixpkgs, 
    flake-utils,
    ...
  }: 
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {
          inherit system;
        };
      in {
        devShells.default = with pkgs;
          mkShell {
            buildInputs = [
              rustup
              rustc
              cargo
              rustlings
            ];
        };
      }
    );
}
