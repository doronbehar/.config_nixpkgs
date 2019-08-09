self: super:

{
  neovim = super.neovim.override {
    withPython = false;
  };
}
