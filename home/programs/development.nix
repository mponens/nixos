{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    lua-language-server
    rust-analyzer
    pyright
	emmet-ls
    typescript-language-server
    gcc
    blender
    nix-direnv
  ];

}
