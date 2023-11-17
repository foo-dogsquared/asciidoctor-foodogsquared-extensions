{ pkgs ? import <nixpkgs> { }
, ruby-nix
, extraPackages ? [ ]
, extraBuildInputs ? [ ]
}:

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
    pkg-config
    zlib
    libiconv
    libgit2
  ] ++ extraBuildInputs;

  packages = [
    # Formatters
    nixpkgs-fmt

    # Language servers
    rnix-lsp
  ] ++ extraPackages;
}
