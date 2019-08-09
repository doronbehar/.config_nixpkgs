self: super:

{
  sxiv = super.sxiv.overrideAttrs (oldAttrs: rec {
    src = self.fetchgit {
      url = "https://github.com/doronbehar/sxiv.git";
      rev = "4c99b47";
      sha256 = "1lc9y6d5qqi0sar211z55vmygibaal6bnwk7jj7336chwavxcbip";
    };
  });
}
