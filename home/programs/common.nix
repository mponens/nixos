{ config, pkgs, ... }: {
  home.packages = with pkgs; [
	man-pages

    zip
    xz
    unzip
    p7zip
    
    ripgrep
    jq
    yq-go
    eza

    mtr
    iperf3
    dnsutils
    ldns
    aria2
    socat
    nmap
    ipcalc

    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg
	gnumake

    nix-output-monitor

    tmux
	neovim

    btop
    iotop
    iftop

    strace
    ltrace
	lsof

	psmisc

    sysstat
    lm_sensors # for `sensors` command
    acpi
    pciutils
    usbutils
  ];


  programs.gh = {
    enable = true;
    gitCredentialHelper = {
      enable = true;
    };
  };

  programs.git = {
    enable = true;
  };

  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.bash = {
    enable = true;
	# Distrobox emergency exit
	bashrcExtra = ''

alias ns="nix search nixpkgs"
alias slop="npx @openai/codex"
[ -n "$DISTROBOX_ENTER_PATH" ] && . "$HOME/.bash-distrobox-rc"
dev-init () {
nix flake init --template "https://flakehub.com/f/the-nix-way/dev-templates/*#$1"
cat << EOF >> .gitignore
.direnv/
EOF
	  }
	'';
  };

  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
  };
}
