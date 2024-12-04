{ config, pkgs, ... }:

let
  tex = (pkgs.texlive.combine {
    inherit (pkgs.texlive) scheme-full;
      # dvisvgm dvipng # for preview and export as html
      # wrapfig amsmath ulem hyperref capt-of listings latexmk xcolor;
    #(setq org-latex-compiler "lualatex")
    #(setq org-preview-latex-default-process 'dvisvgm)
  });
in

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = builtins.getEnv("USER");
  home.homeDirectory = builtins.getEnv("HOME");

  home.stateVersion = "24.05"; # Please read the comment before changing.

  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    lazygit
    miracode
    tmux
    neovim
    ripgrep
    tex
    unzip
    cargo
    gcc
    bat
    eza
    zathura
  ];

  home.file = { 
    ".tmux.conf" = {
      source = ~/wsl-home/terminal/.tmux.conf;
    };
  };

  home.sessionVariables = { };

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "hat082";
    userEmail = "2798638863@qq.com";
    extraConfig = {
      # git config --global init.defaultBranch <name>
      init.defaultBranch = "main";
    };
  };

  programs.ssh = {
    enable = true;
    matchBlocks = {
      "github.com" = {
        host = "github.com";
        identityFile = "~/.ssh/github_key";
        extraOptions = {
          AddKeysToAgent = "yes";
        };
      };
    };
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      # plugins = [ "docker-compose" "docker" ];
      theme = "dst";
    };
    initExtra = ''
      source ~/wsl-home/terminal/zsh.sh
    '';

    shellAliases = {
      s = "home-manager switch --flake ~/wsl-home --impure";
      c = "clear";
      vi = "nvim";
      vim = "nvim";
      lg = "lazygit";
      t = "~/.local/bin/session-starter/session-starter.sh";
      ls = "eza";
      cat = "bat";
    };
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zoxide = {
    enable = true;
    options = [
      "--cmd cd"
    ];

  };
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
