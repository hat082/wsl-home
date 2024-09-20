{ config, pkgs, ... }:

let
  tex = (pkgs.texlive.combine {
    inherit (pkgs.texlive) scheme-basic
      dvisvgm dvipng # for preview and export as html
      wrapfig amsmath ulem hyperref capt-of;
      #(setq org-latex-compiler "lualatex")
      #(setq org-preview-latex-default-process 'dvisvgm)
  });
in

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "asus-ub";
  home.homeDirectory = "/home/asus-ub";

  home.stateVersion = "24.05"; # Please read the comment before changing.

  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    lazygit
    miracode
    tmux
    gcc
    neovim
    ripgrep
    biber  # For bibliography management
    tex
  ];

  home.file = {
  };

  home.sessionVariables = {
  };

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName  = "hat082";
    userEmail = "2798638863@qq.com";
    # extraConfig = {
    #   push = { autoSetupRemote = true; };
    # };
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
      bindkey '^f' autosuggest-accept
      set -o vi
    '';
    shellAliases = {
      s = "home-manager switch --flake ~/wsl-home";
      c = "clear";
      vi = "nvim";
      vim = "nvim";
      lg = "lazygit";
      t = "tmux";


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
}
