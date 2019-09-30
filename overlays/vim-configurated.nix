self: super:

{
  vim_configurable = super.vim_configurable.override {
    python = self.python3;
    guiSupport = "false";
    rubySupport = false;
    multibyteSupport = true;
    ftNixSupport = false;
    cscopeSupport = false;
  };
}
