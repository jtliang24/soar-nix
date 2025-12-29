{
  stdenv,
  fetchurl,
  version,
  ...
}:
let
  hashes = {
    "x86_64-linux" = "sha256:982eca6d34d7d181b5b72fab52756d6d305c9e0810653a1f8837284e389fcc70";
    "aarch64-linux" = "sha256:47eb7729fa4f22db1e513299a93f6c01fdb37a2c6fcb1a6f3d93559caf2d9711"; 
  };
in
stdenv.mkDerivation {
  pname = "soar";
  inherit version;

  src = fetchurl {
    url = "https://github.com/pkgforge/soar/releases/download/${version}/soar-${stdenv.hostPlatform.system}.tar.gz";
    hash = hashes.${stdenv.hostPlatform.system};
  };

  installPhase = ''
    install -Dm755 soar $out/bin/soar
  '';
}
