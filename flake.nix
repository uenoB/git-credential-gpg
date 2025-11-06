{
  description = "Fairly simple git crednetial store encrypted by GnuPG";
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  outputs =
    { self, nixpkgs }:
    let
      inherit (nixpkgs) lib;
      support = _: pkgs: with pkgs.stdenv.hostPlatform; isLinux || isDarwin;
      systems = lib.attrNames (lib.filterAttrs support nixpkgs.legacyPackages);
    in
    {
      packages = lib.genAttrs systems (
        system:
        let
          packages = import ./. { pkgs = nixpkgs.legacyPackages.${system}; };
        in
        packages // { default = packages.git-credential-gpg; }
      );
      overlays = {
        packages = _: pkgs: import ./. { inherit pkgs; };
      };
    };
}
