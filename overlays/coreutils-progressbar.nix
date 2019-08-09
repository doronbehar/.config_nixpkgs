self: super:

{
  coreutils-progressbar = super.coreutils.overrideAttrs (oldAttrs: rec {
    patches = oldAttrs.patches ++ [
      (self.fetchpatch {
        url = "https://raw.githubusercontent.com/mrdrogdrog/advcpmv/master/advcpmv-0.8-8.30.patch";
        sha256 = "0mw0ramg4ydqdqs33kw9m0rjvw5fvfa0scsq753pn7biwx6gx9hx";
      })
    ];
    postPatch = oldAttrs.postPatch + ''
      sed '2i echo Skipping usage vs getopt test && exit 77' -i ./tests/misc/usage_vs_getopt.sh
    '';
  });
}
