{ pkgs ? import <nixpkgs> { }, ruby-nix }:

with pkgs;

let
  gems = ruby-nix.lib pkgs {
    name = "asciidoctor-foodogsquared-extensions";
    ruby = ruby_3_1;
    gemset = ./gemset.nix;
  };
in
mkShell {
  buildInputs = [
    gems.env
    gems.ruby
  ];

  packages = [
    bundix

    # Formatters
    nixpkgs-fmt

    # Language servers
    rnix-lsp
  ];
}
