self: super:

{
  gnumake = super.gnumake.overrideAttrs (oldAttrs: rec {
    meta = oldAttrs.meta // {
      outputsToInstall = oldAttrs.outputs;
    };
  });
}
