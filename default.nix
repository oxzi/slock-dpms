# Based on nixpkgs/pkgs/misc/screensavers/slock/default.nix
let
  pkgs = import <nixpkgs> { };
  stdenv = pkgs.stdenv;
in rec {
  slock = stdenv.mkDerivation rec {
    name = "slock-1.4";
    src = ./.;
    buildInputs = with pkgs.xorg; [ xproto libX11 libXext libXrandr ];
    installFlags = "DESTDIR=\${out} PREFIX=";
    patchPhase = "sed -i '/chmod u+s/d' Makefile";
  };
}
