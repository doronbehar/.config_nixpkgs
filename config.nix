{
  packageOverrides = pkgs: with pkgs; rec {
    polybar = pkgs.polybar.overrideAttrs (oldAttrs: rec {
      buildInputs = [
        cairo xorg.libXdmcp xorg.libpthreadstubs xorg.libxcb pcre xorg.xcbproto xorg.xcbutil
        xorg.xcbutilcursor xorg.xcbutilimage xorg.xcbutilrenderutil xorg.xcbutilwm xcbutilxrm
        python27
        alsaLib
        curl
        mpd_clientlib
        libpulseaudio
        wirelesstools
        libnl
      ];
      src = fetchgit {
        url = "https://github.com/doronbehar/polybar.git";
        rev = "748e96f";
        sha256 = "0w3572pkh5jac4f5854fw365mbr03vkv9sw3lkkfs5d84cnfgczy";
      };
      postConfigure = "";
    });
    awesome = pkgs.awesome.override {
      luaPackages = lua53Packages;
    };
    luaPackages = pkgs.lua53Packages.override {
      overrides = self: super: {
        lua-lsp = pkgs.lua53Packages.lua-lsp.overrideAttrs (oldAttrs: rec {
          src = fetchgit {
            url = "https://github.com/doronbehar/lua-lsp.git";
            rev = "ec1b6f0";
            sha256 = "1mlgb2dp1ah76hjkbkwz0dp2y5mn491v5wf81nm086rb2fa3rzcg";
          };
        });
      };
    };
  };
  allowUnfree = true;
}
