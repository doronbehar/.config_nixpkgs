self: super:

{
  neovim = super.neovim.override {
    withRuby = false;
  };
}
