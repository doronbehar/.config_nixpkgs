self: super:

{
  awesome = super.awesome.override {
    luaPackages = super.lua53Packages;
  };
}
