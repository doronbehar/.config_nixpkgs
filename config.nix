{
  packageOverrides = pkgs: with pkgs; rec {
    polybar = pkgs.polybar.overrideAttrs (oldAttrs: rec {
      buildInputs = [
        cairo xorg.libXdmcp xorg.libpthreadstubs xorg.libxcb pcre xorg.xcbproto xorg.xcbutil
        xorg.xcbutilcursor xorg.xcbutilimage xorg.xcbutilrenderutil xorg.xcbutilwm xcbutilxrm
        python27
        alsaLib
        curl
        mpd_clientlib
        libpulseaudio
        wirelesstools
        libnl
      ];
      src = fetchgit {
        url = "https://github.com/doronbehar/polybar.git";
        rev = "748e96f";
        sha256 = "0w3572pkh5jac4f5854fw365mbr03vkv9sw3lkkfs5d84cnfgczy";
      };
      postConfigure = "";
    });
    awesome = pkgs.awesome.override {
      luaPackages = lua53Packages;
    };
    sxiv = pkgs.sxiv.overrideAttrs (oldAttrs: rec {
      src = fetchgit {
        url = "https://github.com/doronbehar/sxiv.git";
        rev = "4c99b47";
        sha256 = "1lc9y6d5qqi0sar211z55vmygibaal6bnwk7jj7336chwavxcbip";
      };
    });
    neovim = pkgs.neovim.override {
      extraPython3Packages = (ps: with ps; [
        simple-websocket-server
        python-slugify
      ]);
    };
    lua-lsp = pkgs.lua53Packages.lua-lsp.overrideAttrs (oldAttrs: rec {
      src = fetchgit {
        url = "https://github.com/doronbehar/lua-lsp.git";
        rev = "ec1b6f0";
        sha256 = "1mlgb2dp1ah76hjkbkwz0dp2y5mn491v5wf81nm086rb2fa3rzcg";
      };
    });
    octave = pkgs.octave.overrideAttrs (oldAttrs: rec {
      buildInputs = [ gfortran readline ncurses perl flex texinfo qhull
        graphicsmagick pcre pkgconfig fltk zlib curl openblas libsndfile fftw
        fftwSinglePrec portaudio qrupdate arpack libwebp
        # qt
        # qscintilla
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
        # My Addition
        sundials
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
  };
  allowUnfree = true;
}
