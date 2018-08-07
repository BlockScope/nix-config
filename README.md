# Developing with Nix

With help from the [haskell](http://nixos.org/nixpkgs/manual/#users-guide-to-the-haskell-infrastructure) section of the
Nixpkgs Contributors Guide.

    ln -s ~/dev/blockscope/nix-config/overlays.nix ~/.config/nixpkgs/overlays/flare-timing-overlay.nix
    
    nix-build "<nixpkgs>" -A haskellPackages.siggy-chardust
    nix-build "<nixpkgs>" -A haskellPackages.flight-units
    nix-build "<nixpkgs>" -A haskellPackages.flight-latlng
    nix-build "<nixpkgs>" -A haskellPackages.flight-zone
    nix-build "<nixpkgs>" -A haskellPackages.flight-comp
    nix-build "<nixpkgs>" -A haskellPackages.flight-fsdb
    nix-build "<nixpkgs>" -A haskellPackages.flight-gap
    nix-build "<nixpkgs>" -A haskellPackages.flight-igc
    nix-build "<nixpkgs>" -A haskellPackages.flight-kml
    nix-build "<nixpkgs>" -A haskellPackages.flight-track
    nix-build "<nixpkgs>" -A haskellPackages.flight-task
    nix-build "<nixpkgs>" -A haskellPackages.flight-mask
    nix-build "<nixpkgs>" -A haskellPackages.flare-timing
