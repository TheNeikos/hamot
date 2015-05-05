{ pkgs ? (import <nixpkgs> {}) , haskellPackages ? pkgs.haskellPackages_ghc784 }:

haskellPackages.cabal.mkDerivation (self: {
    pname = "hamot";
    version = "0.0.0.0";

    src = ./.;

    isLibrary = true;
    isExecutable = true;

    buildDepends = with haskellPackages; [
      pkgs.stdenv
      cabalInstall
      hlint
    ];

    testDepends = with haskellPackages; [ ];

    meta = {
      homepage = "http://github.com/hamot/hamot";
      description = "Haskell Money Tracker application";
      license = self.stdenv.lib.licenses.gpl2;
      platforms = self.ghc.meta.platforms;
    };
})

