self: super:

{
  beets = super.beets.override {
    enableAcousticbrainz        = true;
    enableAcoustid              = true;
    enableBadfiles              = false;
    enableConvert               = false;
    enableDiscogs               = false;
    enableEmbyupdate            = false;
    enableFetchart              = true;
    enableGmusic                = false;
    enableKeyfinder             = true;
    enableKodiupdate            = false;
    enableLastfm                = true;
    enableLoadext               = false;
    enableMpd                   = true;
    enablePlaylist              = true;
    enableReplaygain            = true;
    enableSonosUpdate           = false;
    enableSubsonicupdate        = false;
    enableThumbnails            = false;
  };
}
