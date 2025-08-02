{ config, pkgs, ... }: {
  home.packages = with pkgs; [
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

    nix-output-monitor

    neovim
	kitty
    tmux
    obsidian
    anki

    btop
    iotop
    iftop

    strace
    ltrace

    sysstat
    lm_sensors # for `sensors` command
    pciutils
    usbutils

	# audio
	pavucontrol
	pamixer
	bluez
	bluez-tools

  ];


  programs.gh = {
    enable = true;
	gitCredentialHelper = {
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

  programs.firefox.enable = true;

}
