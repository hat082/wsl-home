{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "asus-ub";
  home.homeDirectory = "/home/asus-ub";

  home.stateVersion = "24.05"; # Please read the comment before changing.

  fonts.fontconfig.enable = true;
  home.packages = [
    pkgs.neovim
    pkgs.lazygit
    pkgs.miracode
  ];

  home.file = {
  };

  home.sessionVariables = {
  };

  programs.home-manager.enable = true;

  programs.bash = {
    enable = true;
    shellAliases = {
      s = "home-manager switch --flake ~/wsl-home";
      c = "clear";
      vi = "nvim";
      vim = "nvim";
      lg = "lazygit";
    };
    initExtra = "set -o vi\n";
      
  };

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
    };
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}
