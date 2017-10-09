self: super:

let hlib = super.haskell.lib;
    ft = (subpkg: ~/dev/src/blockscope/flare-timing + "/${subpkg}");
in
{
  haskellPackages = super.haskellPackages.override {
    overrides = x: _x: rec {

      fgl = _x.callCabal2nix "fgl" (super.fetchFromGitHub {
        owner = "haskell";
        repo = "fgl";
        rev = "e29503775e474b7a7cd8951b6bebcf1529b888b5";
        sha256 = "0biwsaj6s24l8ix95hkw4syl87ywxy363pr413kazzbhi0csf20s";
      }) {};

      siggy-chardust = self.callPackage (ft "siggy-chardust") {};
      flight-kml = self.callPackage (ft "kml") {};
      flight-igc = self.callPackage (ft "igc") {};
      flight-gap = self.callPackage (ft "gap") {};

      flight-units = self.callPackage (ft "units") {
        siggy-chardust = x.siggy-chardust;
      };

      flight-latlng = self.callPackage (ft "latlng") {
        siggy-chardust = x.siggy-chardust;
        flight-units = x.flight-units;
      };

      flight-zone = self.callPackage (ft "zone") {
        siggy-chardust = x.siggy-chardust;
        flight-units = x.flight-units;
        flight-latlng = x.flight-latlng;
      };

      flight-task = self.callPackage (ft "task") {
        siggy-chardust = x.siggy-chardust;
        flight-units = x.flight-units;
        flight-latlng = x.flight-latlng;
        flight-zone = x.flight-zone;
        fgl = x.fgl;
      };

      flight-comp = self.callPackage (ft "comp") {
        siggy-chardust = x.siggy-chardust;
        flight-units = x.flight-units;
        flight-latlng = x.flight-latlng;
        flight-zone = x.flight-zone;
      };

      flight-fsdb = self.callPackage (ft "fsdb") {
        siggy-chardust = x.siggy-chardust;
        flight-units = x.flight-units;
        flight-latlng = x.flight-latlng;
        flight-comp = x.flight-comp;
      };

      flight-track = self.callPackage (ft "track") {
        flight-comp = x.flight-comp;
        flight-kml = x.flight-kml;
      };

      flight-mask = self.callPackage (ft "mask") {
        siggy-chardust = x.siggy-chardust;
        flight-units = x.flight-units;
        flight-latlng = x.flight-latlng;
        flight-zone = x.flight-zone;
        flight-task = x.flight-task;
        flight-comp = x.flight-comp;
        flight-kml = x.flight-kml;
        flight-gap = x.flight-gap;
        flight-track = x.flight-track;
        fgl = x.fgl;
      };

      flare-timing = self.callPackage (ft "flare-timing") {
        siggy-chardust = x.siggy-chardust;
        flight-units = x.flight-units;
        flight-latlng = x.flight-latlng;
        flight-zone = x.flight-zone;
        flight-task = x.flight-task;
        flight-comp = x.flight-comp;
        flight-fsdb = x.flight-fsdb;
        flight-kml = x.flight-kml;
        flight-igc = x.flight-igc;
        flight-gap = x.flight-gap;
        flight-mask = x.flight-mask;
        flight-track = x.flight-track;
      };

    };
  };
}
