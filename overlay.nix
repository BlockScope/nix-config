self: super:

let hlib = super.haskell.lib;
in
{
  haskellPackages = super.haskellPackages.override {
    overrides = hpkgs: _hpkgs: rec {

      fgl = _hpkgs.callCabal2nix "fgl" (super.fetchFromGitHub {
        owner = "haskell";
        repo = "fgl";
        rev = "e29503775e474b7a7cd8951b6bebcf1529b888b5";
        sha256 = "0biwsaj6s24l8ix95hkw4syl87ywxy363pr413kazzbhi0csf20s";
      }) {};

      siggy-chardust = self.callPackage ~/dev/src/blockscope/haskell-siggy-chardust {};
      flight-comp = self.callPackage ~/dev/src/blockscope/haskell-flight-comp {};
      flight-kml = self.callPackage ~/dev/src/blockscope/haskell-flight-kml {};
      flight-igc = self.callPackage ~/dev/src/blockscope/haskell-flight-igc {};
      flight-gap = self.callPackage ~/dev/src/blockscope/haskell-flight-gap {};

      flight-fsdb = self.callPackage ~/dev/src/blockscope/haskell-flight-fsdb {
        flight-comp = self.haskellPackages.flight-comp;
      };

      flight-track = self.callPackage ~/dev/src/blockscope/haskell-flight-track {
        flight-comp = self.haskellPackages.flight-comp;
        flight-kml = self.haskellPackages.flight-kml;
      };

      flight-task = self.callPackage ~/dev/src/blockscope/haskell-flight-task {
        fgl = self.haskellPackages.fgl;
        siggy-chardust = self.haskellPackages.siggy-chardust;
      };

      flight-mask = self.callPackage ~/dev/src/blockscope/haskell-flight-mask {
        siggy-chardust = self.haskellPackages.siggy-chardust;
        flight-comp = self.haskellPackages.flight-comp;
        flight-kml = self.haskellPackages.flight-kml;
        flight-gap = self.haskellPackages.flight-gap;
        flight-task = self.haskellPackages.flight-task;
        flight-track = self.haskellPackages.flight-track;
      };

      flare-timing = self.callPackage ~/dev/src/blockscope/flare-timing {
        siggy-chardust = self.haskellPackages.siggy-chardust;
        flight-comp = self.haskellPackages.flight-comp;
        flight-fsdb = self.haskellPackages.flight-fsdb;
        flight-kml = self.haskellPackages.flight-kml;
        flight-igc = self.haskellPackages.flight-igc;
        flight-gap = self.haskellPackages.flight-gap;
        flight-task = self.haskellPackages.flight-task;
        flight-track = self.haskellPackages.flight-track;
      };

    };
  };
}
