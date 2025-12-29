{
  description = "A flake for using Soar declaratively";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      version = "v0.9.1";
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        #"loongarch64-linux"
        #"riscv64-linux"
      ];
      forAllSystems =
        f:
        builtins.listToAttrs (
          map (system: {
            name = system;
            value = f system;
          }) systems
        );
    in
    {
      packages = forAllSystems (
        system:
        let
          pkgs = import nixpkgs { inherit system; };
        in
        {
          soar = pkgs.callPackage ./package.nix { inherit version; };
          default = self.packages.${system}.soar;
        }
      );
    };
}
