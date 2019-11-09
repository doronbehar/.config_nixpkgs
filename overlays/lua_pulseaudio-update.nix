self: super:

# Manual update that I can't wait for nixpkgs to merge
# See https://github.com/NixOS/nixpkgs/pull/73101
{
  lua_pulseaudio_updated = super.luajitPackages.pulseaudio.overrideAttrs(oldAttrs: rec {
    version = "0.2";
    src = super.fetchFromGitHub {
      owner = "doronbehar";
      repo = "lua-pulseaudio";
      rev = "v${version}";
      sha256 = "140y1m6k798c4w7xfl0zb0a4ffjz6i1722bgkdcdg8g76hr5r8ys";
    };
  });
}
