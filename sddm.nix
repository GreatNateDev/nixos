{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  pname = "CBMAnimPetGlobe";
  version = "1.0";
  
  src = fetchurl {
    url = "https://github.com/GreatNateDev/nixos/raw/refs/heads/main/data/CBMAnimPetGlobe.tar.gz";
    sha256 = "sha256-uQ3VgHbkYI6L52M+BGurWNZIBC2CoJHrGEYKDSM6Sao=";
  };

  installPhase = ''
    mkdir -p $out/
    cp -r . $out/
  '';
}
