self: super:

{
  octave-wrapped = super.octave.overrideAttrs (oldAttrs: rec {
    name = "octave-wrapped";
    pythonEnv = super.python3.withPackages(ps: [
      ps.sympy
    ]);
    nativeBuildInputs = [ super.makeWrapper ];
    buildCommand = ''
      makeWrapper ${self.octave}/bin/octave $out/bin/oct --prefix PATH : ${pythonEnv}/bin
    '';
  });
}

