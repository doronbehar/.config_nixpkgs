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
    pulseaudio
  ]);
}
