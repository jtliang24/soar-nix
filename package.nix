{
  stdenv,
  fetchFromGitHub,
  ...
}:
stdenv.mkDerivation {
  pname = "soar";
  version = "v0.9.1";

  src = fetchFromGitHub {
    owner = "pkgforge";
    repo = "soar";
    rev = "v0.9.1";
    sha256 = "sha256-081wCf5ICT32wiVnGbksr9Z2iYCcaB9Ba8lmaJZ3ekk=";
  };

}
