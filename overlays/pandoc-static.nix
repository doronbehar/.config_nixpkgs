self: super:

{
  pandoc = super.stdenv.mkDerivation {
    name = "pandoc";
    src = fetchTarball {
      url = "https://github.com/jgm/pandoc/releases/download/${super.pandoc.version}/pandoc-${super.pandoc.version}-linux.tar.gz";
      sha256 = "192wxd7519zd6whka6bqbhlgmkzmwszi8fgd39hfr8cz78bc8whc";
    };
    buildPhase = "true";
    installPhase = ''
      mkdir $out
      cp -r * $out
    '';
  };
}
