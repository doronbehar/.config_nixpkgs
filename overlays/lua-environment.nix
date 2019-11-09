self: super:

{
  lua = super.luajitPackages.lua.withPackages(ps: with ps; [
    # For vim
    lua-lsp
    # For luarocks not to use curl
    luasocket
    luasec
    # For luarocks upload
    dkjson
    # For awesome
    luaposix
    # See overlay lua_pulseaudio_updated and:
    # https://github.com/NixOS/nixpkgs/pull/73101
    self.lua_pulseaudio_updated
  ]);
}
