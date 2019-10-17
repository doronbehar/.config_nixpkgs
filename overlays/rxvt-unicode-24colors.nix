self: super:

{
  rxvt_unicode = super.rxvt_unicode.overrideAttrs(oldAttrs: rec {
    patches = oldAttrs.patches ++ [
      ./rxvt_unicode-24-bit-color-support.patch
    ];
  });
}
