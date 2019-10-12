self: super:

{
  komodo-python3-dbgp = super.komodo-python3-dbgp.overrideAttrs (oldAttrs: rec {
    patches = [
      (self.fetchpatch {
        url = "https://gist.githubusercontent.com/doronbehar/2a8e9a76cb0d9c72caf8ab0b9847b4bc/raw/94ddbb3e7c2fb46a05ce23fa635d70762ccbb4da/git.patch";
        sha256 = "1qy9k6m5gdnlf3gq4piiivmbvh0rl1bk9jd7mhyn7lfs76hhkild";
      })
    ];
  });
}
