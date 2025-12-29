{
  stdenv,
  fetchzip,
  ...
}:
stdenv.mkDerivation {
  pname = "soar";
  version = "v0.9.1";

  src = fetchzip {
    url = "https://github.com/pkgforge/soar/releases/download/v0.9.1/soar-x86_64-linux.tar.gz";
    hash = "sha256-SGQrNLNFDN3SHSTX6FMFy46nQBTK+I91znU/CyMTfBE=";
  };

  installPhase = ''
    install -Dm755 soar $out/bin/soar
  '';
}
