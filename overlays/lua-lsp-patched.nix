self: super:

{
  lua-lsp = super.lua53Packages.lua-lsp.overrideAttrs (oldAttrs: rec {
    patches = [
      (self.fetchpatch {
        url = "https://patch-diff.githubusercontent.com/raw/Alloyed/lua-lsp/pull/26.patch";
        sha256 = "15rfw1nx0xi3ggyr3bymx3kbhwyk0xw9apywd0zzp6ya4nxrrcv3";
      })
    ];
  });
}
