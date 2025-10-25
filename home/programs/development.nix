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

    # Formatters
    stylua
    black
    isort
    rustfmt
    prettierd
  ];
  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    nix-direnv.enable = true;
  };

}
