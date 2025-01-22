{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  pname = "sddmer";
  version = "1.0";
  
  src = fetchurl {
    url = "";
    sha256 = "";
  };

  installPhase = ''
    mkdir -p $out/share/sddm/themes
    cp -r . $out/share/sddm/themes/${pname}
  '';
}
