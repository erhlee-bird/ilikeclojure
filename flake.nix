{
  description = "erhlee-bird/ilikeclojure development flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        jdk = pkgs.graalvm17-ce;
      in with pkgs; {
        devShell = pkgs.mkShell {
          buildInputs = [
            babashka
            (clojure.override { jdk = jdk; })
            clojure-lsp
            gcc-unwrapped
            gh
            gradle
            jdk
            jq
            (leiningen.override { jdk = jdk; })
            maven
            stdenv.cc.cc.lib
            pre-commit
            rlwrap
          ];

          JAVA_HOME = jdk;
          JAVA_17_HOME = jdk;

          shellHook = ''
            export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:${pkgs.lib.makeLibraryPath [pkgs.stdenv.cc.cc]}"
          '';
        };
      });
}
