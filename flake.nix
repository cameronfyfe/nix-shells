{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = inputs @ { self, ... }:
    (inputs.flake-utils.lib.eachDefaultSystem (system:
      let

        pkgs = import inputs.nixpkgs {
          inherit system;
        };

      in
      rec {

        devShells = {
          iroh-tools = pkgs.mkShell {
            buildInputs = with pkgs; [
              dumbpipe
              sendme
            ];
          };
        };

      }));
}
