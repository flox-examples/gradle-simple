{callPackage,pkgs,...}:
    let
      buildGradle = callPackage ./gradle-env.nix {};
    in
      buildGradle {
        pname = "gradle-simple";
        nativeBuildInputs = with pkgs; [ openjdk];
        envSpec = ./gradle-env.json;
        src = ../..;
         gradleFlags = [ "distTar" ];

         installPhase = ''
           mkdir $out
           pushd build/distributions
           tar -xf *.tar
           cp -r */* $out
           popd
         '';
      }
