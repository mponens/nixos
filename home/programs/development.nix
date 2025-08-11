{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    lua-language-server
    rust-analyzer
    pyright
	emmet-ls
    ccls
    typescript-language-server
    gcc
    blender
    nix-direnv
  ];

}
