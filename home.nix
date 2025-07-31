{ config, pkgs, ... }: {
  home.username = "daniel";
  home.homeDirectory = "/home/daniel";

  home.packages = with pkgs; [
    zip
    xz
    unzip
    p7zip
    
    ripgrep
    jq
    yq-go
    fzf
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
    
  ];

  programs.git = {
    enable = true;
    userName = "Daniel Jin";
    userEmail = "mrpickles123115@gmail.com";
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
  };

  programs.firefox.enable = true;

  programs.kitty = {
    enable = true;
    settings = {
      enable_audio_bell = false;
      cursor_trail = 3;
      cursor_trail_decay = "0.2 0.3";
    };
  };
  home.stateVersion = "25.05";
}
