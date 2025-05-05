{
  config,
  pkgs,
  ...
}: let
in {
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = builtins.getEnv "USER";
  home.homeDirectory = builtins.getEnv "HOME";

  home.stateVersion = "24.05"; # Please read the comment before changing.

  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    lazygit
    miracode
    tmux
    neovim
    ripgrep
    fd
    yazi
    unzip
    cargo
    go
    gcc
    bat
    eza
    alejandra
    xdg-utils
    lua
    bear
    gdb
    typst
  ];

  # home.file.".clangd".text = ''
  #   CompileFlags:
  #     Add: [-std=c++17, -I/usr/include, -I/usr/local/include]
  #   FallbackFlags: [-Wall, -Wextra, -Wpedantic]
  # '';

  home.sessionVariables = {};

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "hat082";
    userEmail = "2798638863@qq.com";
    extraConfig = {
      # git config --global init.defaultBranch <name>
      init.defaultBranch = "main";
      url = {
        "git@github.com:" = {
          insteadOf = "gh:";
        };
        "git@github.com:hat082/" = {
          insteadOf = "ha:";
        };
      };
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
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
  };
}
