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
    
    #development
    lua-language-server
    rust-analyzer
    pyright
    typescript-language-server
    
    # Formatters
    stylua
    black
    isort
    rustfmt
    prettierd
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

  programs.neovim = {
    enable = true;
    defaultEditor = true;

    plugins = with pkgs.vimPlugins; [
      # Core plugins
      vim-sensible
      nvim-web-devicons
      nvim-tree-lua
      
      # Themes
      dracula-vim
      nord-vim
      catppuccin-nvim
      
      # LSP and completion
      nvim-lspconfig
      mason-nvim
      mason-lspconfig-nvim
      nvim-cmp
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      cmp-cmdline
      
      # Language specific
      nvim-jdtls
      rust-tools-nvim
      
      # Treesitter
      (nvim-treesitter.withPlugins (p: [
        p.tree-sitter-nix
        p.tree-sitter-vim
        p.tree-sitter-lua
        p.tree-sitter-rust
        p.tree-sitter-java
        p.tree-sitter-javascript
        p.tree-sitter-typescript
        p.tree-sitter-python
        p.tree-sitter-markdown
        p.tree-sitter-json
        p.tree-sitter-html
        p.tree-sitter-css
      ]))
      nvim-ts-autotag
      
      # Utilities
      comment-nvim
      glow-nvim
      vimux
      conform-nvim
      vim-tmux-navigator
      
      # Snippets
      luasnip
      friendly-snippets
      
      # Telescope
      plenary-nvim
      telescope-nvim
      
      # AI/Markdown
      codecompanion-nvim
      mini-nvim
      render-markdown-nvim
      
      # vim-wakatime
    ];
  };
}
