{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    lua-language-server
    rust-analyzer
    pyright
	emmet-ls
    ccls
    typescript-language-server
    jdt-language-server
    gcc
    blender
  ];
  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    nix-direnv.enable = true;
  };

}
