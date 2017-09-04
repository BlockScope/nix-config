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

      siggy-chardust = self.callPackage ~/dev/src/blockscope/flare-timing/siggy-chardust {};
      flight-comp = self.callPackage ~/dev/src/blockscope/flare-timing/comp {};
      flight-kml = self.callPackage ~/dev/src/blockscope/flare-timing/kml {};
      flight-igc = self.callPackage ~/dev/src/blockscope/flare-timing/igc {};
      flight-gap = self.callPackage ~/dev/src/blockscope/flare-timing/gap {};

      flight-units = self.callPackage ~/dev/src/blockscope/flare-timing/units {
        siggy-chardust = self.haskellPackages.siggy-chardust;
      };

      flight-fsdb = self.callPackage ~/dev/src/blockscope/flare-timing/fsdb {
        flight-comp = self.haskellPackages.flight-comp;
      };

      flight-track = self.callPackage ~/dev/src/blockscope/flare-timing/track {
        flight-comp = self.haskellPackages.flight-comp;
        flight-kml = self.haskellPackages.flight-kml;
      };

      flight-task = self.callPackage ~/dev/src/blockscope/flare-timing/task {
        fgl = self.haskellPackages.fgl;
        siggy-chardust = self.haskellPackages.siggy-chardust;
        flight-units = self.haskellPackages.flight-units;
      };

      flight-mask = self.callPackage ~/dev/src/blockscope/flare-timing/mask {
        siggy-chardust = self.haskellPackages.siggy-chardust;
        flight-units = self.haskellPackages.flight-units;
        flight-comp = self.haskellPackages.flight-comp;
        flight-kml = self.haskellPackages.flight-kml;
        flight-gap = self.haskellPackages.flight-gap;
        flight-task = self.haskellPackages.flight-task;
        flight-track = self.haskellPackages.flight-track;
      };

      flare-timing = self.callPackage ~/dev/src/blockscope/flare-timing/flare-timing {
        siggy-chardust = self.haskellPackages.siggy-chardust;
        flight-units = self.haskellPackages.flight-units;
        flight-comp = self.haskellPackages.flight-comp;
        flight-fsdb = self.haskellPackages.flight-fsdb;
        flight-kml = self.haskellPackages.flight-kml;
        flight-igc = self.haskellPackages.flight-igc;
        flight-gap = self.haskellPackages.flight-gap;
        flight-task = self.haskellPackages.flight-task;
        flight-mask = self.haskellPackages.flight-mask;
        flight-track = self.haskellPackages.flight-track;
      };

    };
  };
}
