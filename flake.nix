{
  description = "Fairly simple git crednetial store encrypted by GnuPG";
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  outputs =
    { self, nixpkgs }:
    with nixpkgs;
    {
      packages = lib.genAttrs (builtins.attrNames legacyPackages) (
        system:
        import ./default.nix {
          pkgs = nixpkgs.legacyPackages.${system};
        }
      );
      defaultPackage = lib.mapAttrs (_: v: v.git-credential-gpg) self.packages;
    };
}
