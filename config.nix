{
  packageOverrides = pkgs: with pkgs; rec {
    polybar = pkgs.polybar.overrideAttrs (oldAttrs: rec {
      buildInputs = [
        cairo xorg.libXdmcp xorg.libpthreadstubs xorg.libxcb pcre xorg.xcbproto xorg.xcbutil
        xorg.xcbutilcursor xorg.xcbutilimage xorg.xcbutilrenderutil xorg.xcbutilwm xcbutilxrm
        alsaLib
        curl
        mpd_clientlib
        libpulseaudio
        wirelesstools
        libnl
      ];
      nativeBuildInputs = oldAttrs.nativeBuildInputs ++ [python];
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
    gifsicle = pkgs.gifsicle.overrideAttrs (oldAttrs: rec {
      buildInputs = with pkgs.xorg; [ xorgproto libXt libX11 ];
      configureFlags = [];
    });
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
    coreutils-progressbar = pkgs.coreutils.overrideAttrs(oldAttrs: rec {
      name = "coreutils-patched";
      patches = oldAttrs.patches ++ [(fetchpatch {
        name = "advcpmv-0.8-8.30.patch";
        url = "https://raw.githubusercontent.com/mrdrogdrog/advcpmv/master/advcpmv-0.8-8.30.patch";
        sha256 = "0mw0ramg4ydqdqs33kw9m0rjvw5fvfa0scsq753pn7biwx6gx9hx";
      })];
      postPatch = oldAttrs.postPatch + ''
        sed '2i echo Skipping usage vs getopt test && exit 77' -i ./tests/misc/usage_vs_getopt.sh
      '';
    });
    mpv-with-scripts = pkgs.mpv-with-scripts.override {
      scripts = [pkgs.mpvScripts.mpris];
    };
  };
  allowUnfree = true;
}
