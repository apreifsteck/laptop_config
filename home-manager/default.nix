{ config, lib, pkgs, ...}: {
    # The home.packages option allows you to install Nix packages into your
    # environment.
    imports = [
      ./kitty.nix
      ./helix.nix
      ./git.nix
      ./zsh.nix
      ./zoxide.nix
      ./starship.nix
      ./mcfly.nix
      ./broot.nix
    ];
    
    home.packages = [
    #   # # It is sometimes useful to fine-tune packages, for example, by applying
    #   # # overrides. You can do that directly here, just don't forget the
    #   # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    #   # # fonts?
    #   # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    #   # # You can also create simple shell scripts directly inside your
    #   # # configuration. For example, this adds a command 'my-hello' to your
    #   # # environment:
    #   # (pkgs.writeShellScriptBin "my-hello" ''
    #   #   echo "Hello, ${config.home.username}!"
    #   # '')
      pkgs.spotify
      pkgs.obsidian
      pkgs.arc-browser
      pkgs.slack
      pkgs.postman
      pkgs.rectangle
      pkgs.devenv
      pkgs.atac
      pkgs.tldr
    ];

    # # Home Manager is pretty good at managing dotfiles. The primary way to manage
    # # plain files is through 'home.file'.
    home.file = {
      # # Building this configuration will create a copy of 'dotfiles/screenrc' in
      # # the Nix store. Activating the configuration will then make '~/.screenrc' a
      # # symlink to the Nix store copy.
      # ".screenrc".source = dotfiles/screenrc;

      # # You can also set the file content immediately.
      # ".gradle/gradle.properties".text = ''
      #   org.gradle.console=verbose
      #   org.gradle.daemon.idletimeout=3600000
      # '';
      ".obsidian.vimrc".source = ../.obsidian.vimrc;
    };

    # # Home Manager can also manage your environment variables through
    # # 'home.sessionVariables'. If you don't want to manage your shell through Home
    # # Manager then you have to manually source 'hm-session-vars.sh' located at
    # # either
    # #
    # #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
    # #
    # # or
    # #
    # #  /etc/profiles/per-user/austinreifsteck/etc/profile.d/hm-session-vars.sh
    # #
    home.sessionVariables = {
      ERL_AFLAGS = "-kernel shell_history enabled";
    };

    home.activation = lib.mkIf pkgs.stdenv.isDarwin {
        copyApplications =
          let
            apps = pkgs.buildEnv {
              name = "home-manager-applications";
              paths = config.home.packages;
              pathsToLink = "/Applications";
            };
          in
          lib.hm.dag.entryAfter [ "writeBoundary" ] ''
            baseDir="$HOME/Applications/Home Manager Apps"
            if [ -d "$baseDir" ]; then
              rm -rf "$baseDir"
            fi
            mkdir -p "$baseDir"
            for appFile in ${apps}/Applications/*; do
              target="$baseDir/$(basename "$appFile")"
              $DRY_RUN_CMD cp ''${VERBOSE_ARG:+-v} -fHRL "$appFile" "$baseDir"
              $DRY_RUN_CMD chmod ''${VERBOSE_ARG:+-v} -R +w "$target"
            done
          '';
      }; 

    # # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;
}
