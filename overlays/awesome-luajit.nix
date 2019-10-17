self: super:

{
  awesome = super.awesome.override {
    luaPackages = super.luajitPackages;
  };
}
