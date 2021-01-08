let
  nixpkgs-src = builtins.fetchTarball {
    # master of 2020-11-21.
    url = "https://github.com/NixOS/nixpkgs/archive/2247d824fe07f16325596acc7faa286502faffd1.tar.gz";
    sha256 = "sha256:09jzdnsq7f276cfkmynqiaqg145k8z908rlr0170ld1sms1a83rw";
  };

  nixpkgs = import nixpkgs-src { config = { allowUnfree = true; }; };

  inherit (nixpkgs) pkgs lib stdenv;

  lib-path = lib.makeLibraryPath [
    stdenv.cc.cc
    pkgs.linuxPackages.nvidia_x11
  ];

in

pkgs.mkShell {
  buildInputs = with pkgs; [
    python3
  ];

  shellHook = ''
    export "LD_LIBRARY_PATH=${lib-path}"
  '';
}
