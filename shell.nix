{
  pkgs ? import <nixpkgs> {}
}:
with pkgs;
let
  pythonWithPackages = python3.withPackages (pkg: [
    pkg.six
    pkg.future
    pkg.setuptools
    pkg.jinja2
    pkg.ply
    pkg.protobuf
  ]);
in
mkShell {
  buildInputs = [
    git
    gitRepo
    pythonWithPackages
    ninja
    cmake
    libxml2
    qemu
  ];
}
