with import <nixpkgs> {};

let
  myLibPath = with pkgs; lib.makeLibraryPath [
    libGL
    libxkbcommon
    wayland
    xorg.libX11
    xorg.libXcursor
    xorg.libXi
    xorg.libXrandr
  ];
in

stdenv.mkDerivation {
  name = "HammerScale";
  buildInputs = [
    cargo
    rust-analyzer
    rustc
    rustfmt
    xorg.libxcb
  ];

  libPath = with pkgs; lib.makeLibraryPath [
    libGL
    libxkbcommon
    wayland
    xorg.libX11
    xorg.libXcursor
    xorg.libXi
    xorg.libXrandr
  ];
  RUST_SRC_PATH = rustPlatform.rustLibSrc;
  LD_LIBRARY_PATH = myLibPath;
}
