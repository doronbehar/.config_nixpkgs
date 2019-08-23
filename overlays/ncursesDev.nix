self: super:

{
  ncurses = super.ncurses.overrideAttrs (oldAttrs: rec {
    meta = oldAttrs.meta // {
      outputsToInstall = oldAttrs.outputs;
    };
  });
}
