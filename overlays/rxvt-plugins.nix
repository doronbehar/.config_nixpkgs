self: super:

{
  rxvt-unicode = super.rxvt-unicode.override {
    configure = { availablePlugins, ... }: {
      plugins = [
        availablePlugins.bidi
      ];
    };
  };
}

