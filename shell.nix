{ pkgs ? import <nixpkgs> { } }:

with pkgs;

let
  gems = bundlerEnv {
    name = "asciidoctor-foodogsquared-extensions";
    gemdir = ./.;
  };
in
mkShell {
  packages = [
    gems
    gems.wrappedRuby
    bundix

    # Formatters
    nixpkgs-fmt

    # Language servers
    rnix-lsp
  ];
}
