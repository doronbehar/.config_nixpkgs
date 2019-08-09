self: super:

{
  # from some reason, this just isn't enough
  # gifsicle = super.gifsicle.override {
    # gifview = true;
  # };
  gifsicle = super.gifsicle.overrideAttrs (oldAttrs: rec {
    buildInputs = with super.xorg; [ xorgproto libXt libX11 ];
    configureFlags = [];
  });
}

