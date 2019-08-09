self: super:

{
  neovim = super.neovim.override {
    extraPython3Packages = (with super.python3Packages; [
      simple-websocket-server
      python-slugify
    ]);
  };
}
