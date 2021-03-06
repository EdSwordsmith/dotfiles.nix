{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home = {
    username = "eduardoespadeiro";
    homeDirectory = "/Users/eduardoespadeiro";

    packages = with pkgs; [
      gnupg
      gcc
      cmake
      rustup
      rust-analyzer
      neofetch
      tmux
      wget
      ripgrep
      glfw
      pkg-config
    ];

    sessionVariables = rec {
      EDITOR = "nvim";
    };

    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    stateVersion = "22.05";
  };

  # Neovim
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    plugins = with pkgs.vimPlugins; [
      vim-nix
    ];
  };

  programs.git = {
    enable = true;
    userName = "Eduardo Espadeiro";
    userEmail = "eduardo.espadeiro@tecnico.ulisboa.pt";
    extraConfig = {
      color.ui = true;
      pull.rebase = true;
      init.defaultBranch = "main";
      url."git@github.com".pushinsteadOf = "https://github.com/";
    };
    ignores = [
      ".DS_Store"
    ];
    signing = {
      signByDefault = true;
      key = "0CF1C5EAF76639CE034D9A5E686B41F974804CC1";
    };
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      hostname = {
        ssh_only = false;
        format =  "[$hostname](bold blue) ";
      };
    };
  };

  programs.fish = {
    enable = true;
    shellAliases = {
      doom = "~/.emacs.d/bin/doom";
      nshell = "nix-shell --command $SHELL";
      vi = "~/.nix-profile/bin/vi";
      vim = "~/.nix-profile/bin/vim";
    };
  };

  programs.bat.enable = true;

  programs.exa = {
    enable = true;
    enableAliases = true;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
