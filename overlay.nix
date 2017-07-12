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
      flight-kml = self.callPackage ~/dev/src/blockscope/haskell-flight-kml {};
      flight-igc = self.callPackage ~/dev/src/blockscope/haskell-flight-igc {};
      flight-fsdb = self.callPackage ~/dev/src/blockscope/haskell-flight-fsdb {};
      flight-gap = self.callPackage ~/dev/src/blockscope/haskell-flight-gap {};

      flight-task = self.callPackage ~/dev/src/blockscope/haskell-flight-task {
        fgl = self.haskellPackages.fgl;
      };

      flare-timing = self.callPackage ~/dev/src/blockscope/flare-timing {
        flight-fsdb = self.haskellPackages.flight-fsdb;
        flight-kml = self.haskellPackages.flight-kml;
        flight-igc = self.haskellPackages.flight-igc;
      };

    };
  };
}
