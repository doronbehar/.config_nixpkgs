self: super:

{
  octave = super.octave.overrideAttrs (oldAttrs: rec {
    buildInputs = with super; [ gfortran readline ncurses perl flex texinfo qhull
      graphicsmagick pcre pkgconfig fltk zlib curl openblas libsndfile fftw
      fftwSinglePrec portaudio qrupdate arpack libwebp
      # ----------
      # my removal
      # qt
      # qscintilla
      # ----------
      #
      # This is commented along with --enable-jit because of:
      # - https://savannah.gnu.org/bugs/?func=detailitem&item_id=55469
      # - https://savannah.gnu.org/bugs/?func=detailitem&item_id=55492
      # - https://savannah.gnu.org/bugs/?func=detailitem&item_id=46192
      # llvm_8
      ghostscript
      hdf5
      glpk
      suitesparse
      openjdk11
      gnuplot
      python37
      libGLU_combined
      xorg.libX11
      # ----------
      # My Addition
      sundials
      # ----------
      ];
    configureFlags =
      [ "--enable-readline"
        "--enable-dl"
        "--with-blas=openblas"
        "--with-lapack=openblas"
        "--enable-64"
        # "--enable-jit"
      ];
  });
}

