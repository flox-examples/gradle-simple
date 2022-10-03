{callPackage,...}:
    let
      buildGradle = callPackage ./gradle-env.nix {};
    in
      buildGradle {
        pname = "gradle-simple";
    
        envSpec = ./gradle-env.json;
    
        src = ../..;
    
        gradleFlags = [];
    
        installPhase = ''
          exit 2
        '';
      }
