{ system, compiler, flags, pkgs, hsPkgs, pkgconfPkgs, ... }:
  {
    flags = {};
    package = {
      specVersion = "2.2";
      identifier = { name = "yeskell"; version = "0.1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "aria@ar1as.space";
      author = "Aria Edmonds";
      homepage = "";
      url = "";
      synopsis = "";
      description = "";
      buildType = "Simple";
      };
    components = {
      exes = {
        "yeskell" = { depends = [ (hsPkgs.base) (hsPkgs.discord-haskell) ]; };
        };
      };
    } // rec { src = (pkgs.lib).mkDefault ../.; }