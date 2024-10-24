{ pkgs, ... }: {
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = [ ];

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  programs.direnv = {
    enable = true;
    nix-direnv = {
      enable = true;
    };
  };

  homebrew = {
    enable = true;

    brews = [
      "openssl@3"
      "wxwidgets"
      "unixodbc"
    ];
  };

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  # Set macOS defaults (https://github.com/LnL7/nix-darwin/tree/master/modules/system/defaults)
  system.defaults.NSGlobalDomain.InitialKeyRepeat = 12;
  system.defaults.NSGlobalDomain.KeyRepeat = 2;
  system.defaults.NSGlobalDomain.AppleShowAllFiles = true; # shows hidden files
  system.defaults.NSGlobalDomain.AppleInterfaceStyle = "Dark";
  
  system.defaults.dock.autohide = true;
  system.defaults.dock.mru-spaces = false;
  system.defaults.dock.orientation = "bottom";
  system.defaults.dock.showhidden = true;
}
