{pkgs ? import <nixpkgs> {} }:

let
  spec = builtins.fromJSON (builtins.readFile ./haskell-nix-src.json);
  haskell-nix-src = pkgs.fetchgit {
    name = "haskell-lib";
    inherit (spec) url rev sha256 fetchSubmodules;
  };
  haskell = import haskell-nix-src {inherit pkgs;};

  pkgSet = haskell.mkCabalProjectPkgSet {
    plan-pkgs = import ./pkgs.nix;
    pkg-def-extras = [];
    modules = [];
  };

in pkgSet.config.hsPkgs // { _config = pkgSet.config; }
