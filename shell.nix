{ pkgs ? import <nixpkgs> { }
, extraPackages ? [ ]
, extraBuildInputs ? [ ]
}:

with pkgs;

mkShell {
  buildInputs = [
    # Dependencies for Nokogiri.
    pkg-config
    zlib
    libiconv

    # Dependencies for rugged.
    libgit2
  ] ++ extraBuildInputs;

  packages = [
    # Formatters
    nixpkgs-fmt

    # Language servers
    rnix-lsp
  ] ++ extraPackages;
}
