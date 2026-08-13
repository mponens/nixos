{ config, pkgs, ... }: {
  home.packages = with pkgs; [
	asm-lsp
    lua-language-server
	python3
    pyright
	rustup
	emmet-ls
    ccls
    typescript-language-server
    jdt-language-server
    gcc
	virt-manager

	nushell

    # Formatters
    stylua
    black
    isort
    prettierd

	nodejs_22

	distrobox

	wireguard-tools
  ];
  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    nix-direnv.enable = true;
  };

}
