# Based on nixpkgs: ./pkgs/misc/screensavers/slock/default.nix

with import <nixpkgs> {};

stdenv.mkDerivation rec {
  name = "slock";
  src = lib.cleanSource ./.;

  buildInputs = with xorg; [ xorgproto libX11 libXext libXrandr libxcrypt ];

  installFlags = [ "PREFIX=$(out)" ];

  postPatch = "sed -i '/chmod u+s/d' Makefile";
}
