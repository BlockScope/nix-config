{
    packageOverrides = super: let self = super.pkgs; in
    {
      haskellPackages = super.haskellPackages.override {
        overrides = self: super: {
          flight-fsdb = self.callPackage ../dev/src/blockscope/haskell-flight-fsdb {};
          flight-kml = self.callPackage ../dev/src/blockscope/haskell-flight-kml {};
          flight-igc = self.callPackage ../dev/src/blockscope/haskell-flight-igc {};
        };
      };
    };
  }
