{
  pkgs ? import <nixpkgs> { },
}:

{
  git-credential-gpg =
    with pkgs;
    stdenvNoCC.mkDerivation {
      pname = "git-credential-gpg";
      version = "1.0.0";
      src = ./.;
      nativeBuildInputs = [ makeWrapper ];
      installPhase = ''
        mkdir -p $out/bin
        install -m 755 git-credential-gpg $out/bin
        wrapProgram $out/bin/git-credential-gpg \
          --prefix PATH : ${
            lib.makeBinPath [
              coreutils
              gnupg
            ]
          }
      '';
    };
}
