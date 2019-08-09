self: super:

{
  polybar = super.polybar.overrideAttrs (oldAttrs: rec {
    buildInputs = with super; [
      cairo xorg.libXdmcp xorg.libpthreadstubs xorg.libxcb pcre xorg.xcbproto xorg.xcbutil
      xorg.xcbutilcursor xorg.xcbutilimage xorg.xcbutilrenderutil xorg.xcbutilwm xcbutilxrm
      alsaLib
      curl
      mpd_clientlib
      libpulseaudio
      wirelesstools
      libnl
    ];
    nativeBuildInputs = oldAttrs.nativeBuildInputs ++ [super.python];
    src = self.fetchgit {
      url = "https://github.com/doronbehar/polybar.git";
      rev = "afddd2019b6998fd7c7234168bec540fac11a03c";
      sha256 = "0pdm7z0k6rgllxby5r2xzq9bm49h09qkm4drkr685hr52w183rxc";
      fetchSubmodules = true;
    };
    postConfigure = "";
  });
}
