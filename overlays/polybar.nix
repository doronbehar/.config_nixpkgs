self: super:

{
  polybar = super.polybar.overrideAttrs (oldAttrs: rec {
    buildInputs = with super; [
      cairo xorg.libXdmcp xorg.libpthreadstubs xorg.libxcb pcre xorg.xcbutil
      xorg.xcbutilcursor xorg.xcbutilimage xorg.xcbutilrenderutil xorg.xcbutilwm xcbutilxrm
      (xorg.xcbproto.override { python = python3; })
      alsaLib
      curl
      mpd_clientlib
      libpulseaudio
      wirelesstools
      libnl
    ];
    nativeBuildInputs = oldAttrs.nativeBuildInputs ++ [super.python3];
    src = self.fetchgit {
      url = "https://github.com/doronbehar/polybar.git";
      rev = "5087f598ff09c7e8c7e087b3e89c2b0141443c2b";
      sha256 = "07v5zfd8mx66639bbp0vb1zfnv6zwmxndxikyk2jlbk6aaw8a3cb";
      fetchSubmodules = true;
    };
    postConfigure = "";
  });
}
