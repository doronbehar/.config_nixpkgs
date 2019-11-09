self: super:

{
  rxvt_unicode-with-plugins = super.rxvt_unicode-with-plugins.override {
    plugins = [
      super.urxvt_bidi
      super.urxvt_perl
      super.urxvt_perls
      super.urxvt_font_size
    ];
    perlDeps = [
      super.urxvt_bidi
    ];
  };
}
